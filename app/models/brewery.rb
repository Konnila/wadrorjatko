class Brewery < ActiveRecord::Base
  include RatingAverage

  validates :name, presence: true
  validate :year_cannot_be_in_the_future
  validates :year, numericality: {greater_than_or_equal_to: 1042}

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def year_cannot_be_in_the_future
    if year > Time.now.year
      errors.add(:year, "can not be in the future")
    end
  end
end
