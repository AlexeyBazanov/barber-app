ActiveAdmin.register Course do

  permit_params :name, :description, :start_at, :finish_at

  filter :name
  filter :start_at
  filter :finish_at

  index do
    id_column
    column :name
    column :start_at
    column :finish_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :start_at
      f.input :finish_at
      f.input :description, as: :quill_editor

      f.has_many :lessons do |lesson_f|
        lesson_f.input :video_id, as: :select, collection: Video.pluck(:name, :id)
        lesson_f.input :start_at
      end
    end
    f.actions
  end

end