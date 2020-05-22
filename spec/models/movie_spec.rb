require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'relationships' do
    it {should belong_to :studio}
    it {should have_many :actor_movies}
    it {should have_many(:actors).through(:actor_movies)}
  end
  it "can get actors ordered by age" do
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
    ActorMovie.create(actor_id: actor1.id, movie_id: movie1.id )
    ActorMovie.create(actor_id: actor2.id, movie_id: movie1.id )
    ActorMovie.create(actor_id: actor3.id, movie_id: movie1.id )

    expect(movie1.age_ordered_actors).to eq([actor2, actor1, actor3])
  end
end
