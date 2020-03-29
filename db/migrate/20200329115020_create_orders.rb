class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :phone, null: false
      t.string :status, default: 'recent'

      t.timestamps
    end
  end
end
