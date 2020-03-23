ActiveAdmin.register Video do
  permit_params :name, :description, :link, :image

  filter :name
  filter :link
  filter :created_at

  index do
    id_column
    column :name
    column :link do |video|
      link_to 'Открыть', video.link, target: '_blank'
    end
    column :created_at
    column :updated_at
    actions
  end

  show do |video|
    attributes_table :title => 'Видео' do
      row :id
      row :name
      row :link do
        link_to video.link, video.link, target: '_blank'
      end
      row :image do
        link_to image_tag(video.image.variant(resize: '100x100^')),
                url_for(video.image), target: '_blank'
      end
      row :description do
        video.description.html_safe
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :link
      f.input :description, as: :quill_editor
      f.input :image, as: :file
    end
    f.actions
  end
end