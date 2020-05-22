require 'rails_helper'

RSpec.describe "Studio Index page", type: :feature do
  it "Can get all studios and their novies" do 
    studio1 = Studio.create(name: "Universal")
    studio2 = Studio.create(name: "Paramount")

    movie1 = Movie.create(title: "Movie1",
                          genre: "Action",
                          creation_year: "1987",
                          studio_id: studio1.id
                          )
    movie2 = Movie.create(title: "Movie2",
                          genre: "Action",
                          creation_year: "1987",
                          studio_id: studio1.id
                          )
    movie3 = Movie.create(title: "Movie3",
                          genre: "Action",
                          creation_year: "1987",
                          studio_id: studio2.id
                          )

    visit ("/studios")

    within (".studio-#{studio1.id}") do
      expect(page).to have_content("Universal")
      expect(page).to have_content("Movie1")
      expect(page).to have_content("Movie2")
    end

    within (".studio-#{studio2.id}") do
      expect(page).to have_content("Paramount")
      expect(page).to have_content("Movie3")
    end
  end
end