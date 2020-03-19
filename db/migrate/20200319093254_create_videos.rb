class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :link, null: false

      t.timestamps
    end
  end
end
