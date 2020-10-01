class AddUserToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :user, index: true
    add_foreign_key :customers, :users
  end
end
