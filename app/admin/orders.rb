ActiveAdmin.register Order do

  menu label: 'Заявки'

  actions :index, :show

  filter :name
  filter :email
  filter :vk_link
  filter :phone
  filter :status, as: :select, collection: -> { Order.statuses.keys }
  filter :created_at
  filter :updated_at

  index do
    id_column
    column :name
    column :email
    column :vk_link
    column :phone
    tag_column :status do |order|
      if order.recent?
        'Новый'
      else
        'Обработанный'
      end
    end
    column :created_at
    actions do |order|
      if order.recent?
        link_to 'Пометить как обработанный', processed_admin_order_path(order), class: 'member_link alert'
      end
    end
  end

  member_action :processed, method: :get do
    resource.processed!
    redirect_to(request.env['HTTP_REFERER'])
  end

end
