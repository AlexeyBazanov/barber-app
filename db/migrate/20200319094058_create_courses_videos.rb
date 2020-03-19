class CreateCoursesVideos < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :videos do |t|
      t.index [:course_id, :video_id]
    end
  end
end
