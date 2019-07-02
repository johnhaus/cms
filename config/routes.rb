Rails.application.routes.draw do

  root 'cms#index'

  # Controller generated for login/password
  get 'access/menu'
  get 'access/login'
  # Added these for login/logout
  post 'access/attempt_login'
  get 'access/logout'
  # create route for 'admin'
  get 'admin', :to => 'access#menu'

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
