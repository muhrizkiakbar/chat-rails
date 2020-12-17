Rails.application.routes.draw do
  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
    namespace :v1 do
      get '/conversations' => "conversation#index", as: "conversations"
      get '/users' => "user#index", as: "users"
      post '/send_message/:user_id' => "message#create", as: "send_message"
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
