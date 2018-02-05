require 'rails_helper'

describe "user creates new movie" do
  it "fills in relevant information" do
    director = Director.create!(name: "Ilana")

    visit new_director_movie_path(director)

    fill_in("movie[title]", with: "Finding Nemo")
    fill_in("movie[description]", with: "A sad fish story")
    click_on("Create Movie")

    expect(page).to have_content("Finding Nemo")
    expect(page).to have_content("A sad fish story")
    expect(page).to have_content("Ilana")
  end
end
