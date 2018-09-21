require 'rails_helper'

RSpec.describe Pet, type: :model do
	fixtures :users

	let(:user) { users(:test) }
	subject {
		described_class.new(
			user: user,
			name: 'Adam'
		)
	}

	describe "Associations" do
		it { should belong_to(:user) }
	end
	
	describe "Validations" do
		it { should be_valid }
		it { should validate_presence_of(:name) }
	end
end