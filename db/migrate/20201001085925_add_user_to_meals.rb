class AddUserToMeals < ActiveRecord::Migration[6.0]
  def change
    add_reference :meals, :user, index: true
    add_foreign_key :meals, :users
  end
end
