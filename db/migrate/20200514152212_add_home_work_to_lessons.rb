class AddHomeWorkToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :home_work, :text
  end
end
