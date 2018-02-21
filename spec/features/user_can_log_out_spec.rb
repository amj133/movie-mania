require 'rails_helper'

describe "user can log out of session" do
  it "successfully ends session" do
    user = User.create!(username: "Billy",
                        password: "test")

    visit login_path
    fill_in('username', with: "Billy")
    fill_in('password', with: "test")
    click_on('Log In')
    click_on('Log Out')

    expect(current_path).to eq(login_path) # prob send to root
    expect(page).to have_content("Please Log In")
    # expect(session[:user_id]).to eq(nil)
  end
end
