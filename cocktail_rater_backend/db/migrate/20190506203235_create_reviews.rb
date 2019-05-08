class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :drink_id
      t.integer :user_id
      t.text :review


      t.timestamps
    end
  end
end
