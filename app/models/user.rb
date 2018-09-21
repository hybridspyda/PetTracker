class User < ApplicationRecord
	has_many :pets

	has_secure_password
	validates_presence_of :first_name, :last_name, :username, :email, :password_digest
	validates_uniqueness_of :username, :email, case_sensitive: false
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validate :check_full_name_and_username

	before_save :downcase_email

	scope :order_by_full_name, -> {
		order(arel_table[:first_name].lower, arel_table[:last_name].lower)
	}

	scope :like_full_name, ->(full_name) {
		where("#{arel_table[:first_name].lower} #{arel_table[:last_name].lower}".matches("%#{full_name}%".downcase))
	}

	scope :like_username, ->(username) {
		where(arel_table[:username].lower.matches("%#{username}%".downcase))
	}

	def downcase_email
		email.downcase!
	end

	def full_name
		[first_name, last_name].join(' ')
	end

	private

		def check_full_name_and_username
			errors.add(:username, "can't be the same as your name") if full_name && (username == full_name || username == full_name.remove(' '))
		end
end
