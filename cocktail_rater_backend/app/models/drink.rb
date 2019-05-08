class Drink < ApplicationRecord
  validates :name, presence: true
  validates :ingredientid_1, presence: true
end
