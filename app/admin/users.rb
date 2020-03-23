ActiveAdmin.register User do
  permit_params :fname, :lname, :email, :password, :password_confirmation

  filter :email
  filter :fname
  filter :lname
  filter :created_at

  index do
    id_column
    column :email
    column :fname
    column :lname
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do |user|
    attributes_table :title => 'Данные' do
      row :id
      row :fname
      row :lname
      row :email
      row :created_at
      row :sign_in_count
      row :last_sign_in_at
    end

    if user.access_keys.present?
      panel 'Ключи доступа' do
        table_for user.access_keys do
          column :course
          column :body
          column :activate
          column :expiration_date
        end
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :fname
      f.input :lname
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end

end