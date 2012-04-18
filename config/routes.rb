Aleb::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :syllabuses, :lessons

  root :to => "syllabuses#index"
end
