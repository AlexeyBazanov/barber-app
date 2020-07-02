class RemoveEmailFieldFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :email, :string
  end
end
