Aleb::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :syllabuses
  resources :lessons do
    collection do
        match 'search' => 'lessons#search', :via => [:get, :post], :as => :search
      end
  end

  get "static/donnercours"
  get "static/help"

  root :to => "lessons#index"

end
