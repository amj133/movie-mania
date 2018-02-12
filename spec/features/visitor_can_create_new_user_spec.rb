require 'rails_helper'

describe "visit can create new user" do
  describe "from root can click sign up" do
    it "creates new user when they submit info" do
      visit '/'

      click_on "Sign Up to Be a User"

      expect(current_path).to eq(new_user_path)

      fill_in("user[username]", with: "funbucket13")
      fill_in("user[password]", with: "test") # can have password confirmation field
      click_on("Create User")

      expect(current_path).to eq(user_path(User.last)) # better than setting last user to a variable
      expect(page).to have_content("Welcome, funbucket13!")
    end
  end

  # Make this a separate test!!!
  describe "from root can sign in if account exists" do
    it "allows existing user to sign in " do
      user = User.create(username: "funbucket13",
                         password: "test")

      visit '/'
      click_on("I already have an account")

      expect(current_path).to eq(login_path)
      fill_in("username", with: user.username) # could also be user[username]
      fill_in("password", with: user.password) # could also be user[password]
      click_on("Log In")

      expect(current_path).to eq(user_path(user))

      expect(page).to have_content("Welcome, #{user.username}")
      expect(page).to have_content("Log Out")
    end
  end
end
