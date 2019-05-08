class Review < ApplicationRecord
  belongs_to :drink
  belongs_to :user
  validates :drink_id, uniqueness: { scope: :user_id,
    message: "User can review each drink only one time." }
end
