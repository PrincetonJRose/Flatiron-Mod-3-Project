class User < ApplicationRecord
  has_many :drinks
  has_many :likes, through: :drinks
  has_many :dislikes, through: :drinks
end
