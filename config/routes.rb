Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "tops#index"
  resources :studytimes, except: [:show]
  get "/studytimes/show", to: "studytimes#show", as: "show_studytimes"
end
