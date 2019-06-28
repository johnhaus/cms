Rails.application.routes.draw do

  root 'cms#index'

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
