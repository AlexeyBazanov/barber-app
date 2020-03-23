class CreateAccessKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :access_keys do |t|
      t.string :body, null: false
      t.references :course, foreign_key: true, null: false
      t.references :user, foreign_key: true
      t.boolean :activate, default: false
      t.date :expiration_date

      t.timestamps
    end

    add_index :access_keys, :body, unique: true
  end
end
