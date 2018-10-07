Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, format: 'json' do
    namespace :v1 do
      post 'auth', to: 'auth#auth_with_access_token'
      post 'auth/:provider', to: 'auth#auth_with_provider'
      resources :djs
    end
  end
end
