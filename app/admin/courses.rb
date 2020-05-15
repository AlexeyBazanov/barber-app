ActiveAdmin.register Course do

  menu label: 'Курсы'

  permit_params :name, :description, :start_at, :finish_at, :image,
                lessons_attributes: [ :id, :video_id, :name, :home_work, :start_at, :_destroy ]
  filter :name
  filter :start_at
  filter :finish_at

  index do
    id_column
    column :name
    column :lessons do |course|
      course.lessons.length
    end
    column :start_at
    column :finish_at
    actions
  end

  show do |course|
    attributes_table :title => 'Курс' do
      row :name
      row :start_at
      row :finish_at
      row :image do
        link_to image_tag(course.image.variant(resize: '100x100^')),
                url_for(course.image), target: '_blank'
      end
      row :description do
        course.description.html_safe
      end
      panel 'Уроки' do
        table_for course.lessons do
          column :video
          column :name
          column :start_at
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :start_at
      f.input :finish_at
      f.input :description, as: :quill_editor
      f.input :image, as: :file

      f.has_many :lessons do |lesson_f|
        lesson_f.input :video_id, as: :select, collection: Video.pluck(:name, :id)
        lesson_f.input :name
        lesson_f.input :start_at
        lesson_f.input :home_work
      end
    end
    f.actions
  end

end