class AddVkLinkToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :vk_link, :string
  end
end
