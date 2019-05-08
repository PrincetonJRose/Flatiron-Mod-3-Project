class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.integer :drink_api_id
      t.string :name
      t.text :instructions
      t.string :category
      t.boolean :alcoholic
      t.string :glass
      t.string :videoURL
      t.string :imageURL

      t.timestamps
    end
  end
end
