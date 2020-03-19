ActiveAdmin.register AccessKey do

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
  end

  form do |f|
    f.inputs do
      f.input :course, collection: Course.all.map {|c|[c.name, c.id]}
      f.input :expiration_date
    end
    f.actions
  end

end