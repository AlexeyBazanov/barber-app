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