require "rails_helper"

describe "user sees all movies" do
  describe "they visit movie index" do
    it "sees all the movies" do
      director = Director.create(name: "Steven Speilberg")
      fred = Movie.create!(title: "Drop Dead Fred", description: "An unhappy housewife gets lifted from deserted island", director: director)
      empire = Movie.create!(title: "Empire Records", description: "Independent Deleware record store", director: director)

      visit director_movies_path(director)

      expect(page).to have_content("All Movies")
      expect(page).to have_content(fred.title)
      expect(page).to have_content(fred.description)
      expect(page).to have_content(empire.title)
      expect(page).to have_content(empire.description)
    end
  end
end
