class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.date :start_at, null: false
      t.date :finish_at, null: false

      t.timestamps
    end
  end
end
