ActiveAdmin.register Article do

  menu label: 'Статьи'

  permit_params :title, :content, :visible, :image

  index do
    id_column
    column :title
    column :visible
    column :created_at
    column :updated_at
    actions
  end

  show do |article|
    attributes_table :title => 'Статья' do
      row :title
      row :content do
        article.content.html_safe
      end
      row :image do
        link_to image_tag(article.image.variant(resize: '100x100^')),
                url_for(article.image), target: '_blank'
      end
      row :visible
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Данные статьи' do
      f.input :title
      f.input :content, as: :quill_editor, input_html: {
          data: { options: { modules: {
              toolbar: [
                  [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                  ['bold', 'italic', 'underline'],
                  [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                  [{ 'indent': '-1'}, { 'indent': '+1' }],
                  [{ 'color': [] }, { 'background': [] }],
                  [{ 'align': [] }],
                  ['link', 'image'],
                  ['clean']
              ]
          },
          placeholder: 'Type something...', theme: 'snow' }
          }
      }
      f.input :image, as: :file
      f.input :visible
    end
    f.actions
  end

end