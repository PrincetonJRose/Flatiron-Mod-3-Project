class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :drinkid
      t.integer :userid
      t.text :review


      t.timestamps
    end
  end
end
