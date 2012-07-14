Aleb::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :syllabuses
  resources :lessons do
    member do
        get 'register'
    end

    collection do
        match 'search' => 'lessons#search', :via => [:get, :post], :as => :search
      end
  end

  get "static/donnercours"

  root :to => "lessons#index"

end
