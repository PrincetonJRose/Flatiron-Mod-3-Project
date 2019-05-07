class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.integer :id_drink
      t.string :name
      t.text :instructions
      t.string :category
      t.boolean :alcoholic
      t.string :glass
      t.string :videoURL
      t.string :imageURL
      t.integer :ingredientid_1
      t.integer :ingredientid_2
      t.integer :ingredientid_3
      t.integer :ingredientid_4
      t.integer :ingredientid_5
      t.integer :ingredientid_6
      t.integer :ingredientid_8
      t.integer :ingredientid_9
      t.integer :ingredientid_10
      t.integer :ingredientid_11
      t.integer :ingredientid_12
      t.integer :ingredientid_13
      t.integer :ingredientid_14
      t.integer :ingredientid_15
      t.string :measure1
      t.string :measure2
      t.string :measure3
      t.string :measure4
      t.string :measure5
      t.string :measure6
      t.string :measure7
      t.string :measure8
      t.string :measure9
      t.string :measure10
      t.string :measure11
      t.string :measure12
      t.string :measure13
      t.string :measure14
      t.string :measure15
      t.integer :userid

      t.timestamps
    end
  end
end
