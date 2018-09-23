Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user do
    root 'top#index'
    get 'login' => 'session#new', as: :login
    resource :session, only: [ :create, :destroy ]
    resource :account, expect: [ :new, :create, :destroy ]
  end
end
