class Drink < ApplicationRecord
  has_many :drink_ingredients
  has_many :ingredients, through: :drink_ingredients
  validates :name, presence: true
end
