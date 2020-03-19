ActiveAdmin.register Video do
  permit_params :name, :description, :link

  filter :name
  filter :link
  filter :created_at

  index do
    id_column
    column :name
    column :link do |video|
      link_to 'Открыть', video.link, target: '_blank'
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :link
      f.input :description, as: :quill_editor
    end
    f.actions
  end
end