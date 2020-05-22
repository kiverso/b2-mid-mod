class Movie < ApplicationRecord
  belongs_to :studio
  has_many :actor_movies
  has_many :actors, through: :actor_movies

  validates_presence_of :title
  validates_presence_of :genre
  validates_presence_of :creation_year

  def age_ordered_actors
    actors.order(:age)
  end

  def actor_average_age
    actors.average(:age).to_f
  end
end