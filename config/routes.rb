Rails.application.routes.draw do

  root 'cms#index'

  get 'cms/index'
  get 'cms/hello'
  get 'cms/other_hello'
  get 'cms/lynda'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
