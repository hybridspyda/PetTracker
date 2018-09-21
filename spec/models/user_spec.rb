require 'rails_helper'

RSpec.describe User, type: :model do
	subject {
		described_class.new(
			first_name: 'John',
			last_name: 'Doe',
			username: 'DoeJ',
			email: 'johndoe@mail.com',
			password: "doej",
			password_confirmation: "doej"
		)
	}

	describe "Associations" do
		it { should have_many(:pets) }
	end

	describe "Validations" do
		it { should be_valid }
		it { should validate_presence_of(:first_name) }
		it { should validate_presence_of(:last_name) }
		it { should validate_presence_of(:username) }
		it { should validate_presence_of(:email) }
		it { should validate_presence_of(:password_digest) }

		it { should validate_uniqueness_of(:username) }
		it { should validate_uniqueness_of(:email) }

		it 'combines first_name and last_name to give full_name' do
			expect(subject.full_name).to eq("#{subject.first_name} #{subject.last_name}")
		end

		it 'is not valid if email not using correct format' do
			subject.email = 'notavalidemail'
			should_not be_valid
			subject.email = 'not@validemail'
			should_not be_valid
			subject.email = 'notavalid.email'
			should_not be_valid
		end

		it 'is not valid if full_name and username are the same' do
			subject.username = subject.full_name
			should_not be_valid
			subject.username = subject.full_name.remove(' ')
			should_not be_valid
		end
	end
end