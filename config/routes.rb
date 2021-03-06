Rails.application.routes.draw do

  root :to => 'public#index'

  # Set up rails routes- creates public_show prefix
  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  # Controller generated for login/password
  get 'access/menu'
  get 'access/login'
  # Added these for login/logout
  post 'access/attempt_login'
  get 'access/logout'
  # create route for 'admin'
  get 'admin', :to => 'access#menu'

  resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end

  resources :subjects do
    member do
      get :delete # add this if you want to have a delete page
    end
  end

  resources :pages do
    member do
      get :delete
    end
  end

  resources :sections do
    member do
      get :delete
    end
  end

  get 'cms/index'
  get 'cms/hello'
  get 'cms/other_hello'
  get 'cms/lynda'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
