class ChangeColumnAlcoholicToStringInDrinks < ActiveRecord::Migration[5.2]
  def change
    change_column :drinks, :alcoholic, :string
  end
end
