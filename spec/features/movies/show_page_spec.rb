require 'rails_helper'

RSpec.describe "Movie show page", type: :feature do
  it "Can movie details" do 
    studio1 = Studio.create(name: "Universal")

    movie1 = Movie.create(title: "Movie1",
                          genre: "Action",
                          creation_year: "1987",
                          studio_id: studio1.id
                          )

    actor1 = Actor.create(name: "Actor1",
                          age: 22)

    actor2 = Actor.create(name: "Actor2",
                          age: 21)

    actor3 = Actor.create(name: "Actor3",
                          age: 30)

    visit("movies/#{movie1.id}")
    expect(page).to have_content('Movie1')
    expect(page).to have_content('Action')
    expect(page).to have_content('1987')
    expect(page).to have_content("Actors: #{Actor2.name}, #{Actor2.name}, #{Actor2.name}")
    expect(page).to have_content("Average actor age: 24.33")
  end
end



