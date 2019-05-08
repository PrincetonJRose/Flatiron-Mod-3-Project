class Dislike < ApplicationRecord
  validates :drinkid, uniqueness: { scope: :userid,
    message: "User can dislike each drink only one time." }

end
