class Review < ApplicationRecord
  validates :drinkid, uniqueness: { scope: :userid,
    message: "User can review each drink only one time." }
end
