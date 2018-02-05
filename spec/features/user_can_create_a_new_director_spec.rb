require 'rails_helper'

describe "as a user" do
  describe "when I visit new" do
    it "they can create a director" do
      visit "/directors/new"

      fill_in("director[name]", with: "Copola")
      click_on("Create Director") # can just put "Create"?? NOT SURE

      expect(page).to have_content("Director: Copola")  # generally don't want feature test reaching out to model (i know this one isn't)
    end
  end
end
