class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :course, foreign_key: true, null: false
      t.references :video, foreign_key: true, null: false
      t.date :start_at

      t.timestamps
    end
  end
end
