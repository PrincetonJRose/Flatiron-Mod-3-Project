class CreateDislikes < ActiveRecord::Migration[5.2]
  def change
    create_table :dislikes do |t|
      t.integer :drinkid
      t.integer :userid


      t.timestamps
    end
  end
end
