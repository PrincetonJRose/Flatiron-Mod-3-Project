class Like < ApplicationRecord
  validates :drinkid, uniqueness: { scope: :userid,
    message: "User can like each drink only one time." }
end
