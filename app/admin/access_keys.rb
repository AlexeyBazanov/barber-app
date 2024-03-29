ActiveAdmin.register AccessKey do

  menu label: 'Ключи доступа'

  permit_params :course_id, :expiration_date

  filter :body
  filter :course, as: :select, collection: -> { Course.all.map {|c| [c.name, c.id]} }
  filter :user, as: :select, collection: -> { User.all.map {|u| [u.email, u.id]} }
  filter :activate
  filter :expiration_date
  filter :created_at

  index do
    id_column
    column :body
    column :course
    column :user
    column :activate
    column :expiration_date
    actions
  end

  show do |access_key|
    attributes_table :title => 'Ключ доступа' do
      row :id
      row :body
      row 'Ссылка на активацию' do
        if Rails.env.production?
          "https://#{Rails.application.config.action_mailer.default_url_options[:host]}#{account_path}?course_code=#{access_key.body}"
        else
          "http://#{Rails.application.config.action_mailer.default_url_options[:host]}:#{Rails.application.config.action_mailer.default_url_options[:port]}#{account_path}?course_code=#{access_key.body}"
        end

      end
      row :user
      row :activate
      row :expiration_date
      row :created_at
    end
  end

  form do |f|
    f.inputs do
      f.input :course, collection: Course.all.map {|c|[c.name, c.id]}
      f.input :expiration_date
    end
    f.actions
  end

end