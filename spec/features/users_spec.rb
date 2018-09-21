require 'rails_helper'

RSpec.feature "Users", type: :feature do
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

	describe "users/new" do
		it "renders new user form"
=begin		do
			render
			assert_select "form[action=?][method=?]", users_path, "post" do
				assert_select "input[name=?]", "user[full_name]"
				assert_select "input[name=?]", "user[username]"
				assert_select "input[name=?]", "user[email]"
				assert_select "input[name=?]", "user[password_digest]"
			end
=end
	end

	describe "users/show" do
		before(:each) do
			@user = User.create!(subject)
		end

		it "renders attributes in <p>"
=begin		 do
			render
			expect(rendered).to match(/Real Name/)
			expect(rendered).to match(/Username/)
			expect(rendered).to match(/Email/)
			expect(rendered).to match(/Password Digest/)
=end
	end

	describe "users/index" do
		let(:other) {
			described_class.new(
				full_name: 'Jane Doe',
				username: 'DoeJane',
				email: 'janedoe@mail.com',
				password: "doejane",
				password_confirmation: "doejane"
			)
		}

		it "renders a list of users"
=begin		 do
			render
			assert_select "tr>td", text: "Real Name".to_s, count: 2
			assert_select "tr>td", text: "Username".to_s, count: 2
			assert_select "tr>td", text: "Email".to_s, count: 2
			assert_select "tr>td", text: "Password Digest".to_s, count: 2
=end
	end

	describe "users/edit" do
		before(:each) do
			@user = User.create!(subject)
		end

		it "renders the edit user form"
=begin		 do
			render
			assert_select "form[action=?][method=?]", user_path(@user), "post" do
				assert_select "input[name=?]", "user[full_name]"
				assert_select "input[name=?]", "user[username]"
				assert_select "input[name=?]", "user[email]"
				assert_select "input[name=?]", "user[password_digest]"
			end
=end
	end
end
