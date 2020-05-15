Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :users
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout',
                                                 password: 'secret', confirmation: 'verification',
                                                 unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  root 'home#index'
  get 'home/index'

  post 'order', to: 'orders#create'

  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret',
  #                                                confirmation: 'verification', unlock: 'unblock',
  #                                                registration: 'register', sign_up: 'cmon_let_me_in' }

  get 'account', to: 'account#index'
  get 'account', to: 'account#index', as: :user_root
  get 'access_course', to: redirect('/account')
  post 'access_course', to: 'account#access_course'
  get 'courses/:id', to: 'courses#show', as: 'courses'
  get 'lessons/:id', to: 'lessons#show', as: 'lessons'


end
