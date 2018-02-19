require 'api_constraints'
Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json }, path: '/'  do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: %i(index)
      resources :producers, only: %i(create update index show)
     post 'users/sign_up', to: 'users#sign_up'
     post 'users/sign_in', to: 'users#sign_in'
    end
  end
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
