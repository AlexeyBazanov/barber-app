class ChangeOrders < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :phone, :string, null: true
    change_column :orders, :vk_link, :string, null: true
    add_column :orders, :contacts, :string, null: false, default: ''
  end
end
