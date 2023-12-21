Rails.application.routes.draw do
  get "/prayers" => "prayers#index"
  post "/prayers" => "prayers#create"
  get "/prayers/:id" => "prayers#show"
  patch "/prayers/:id" => "prayers#update"
  delete "/prayers/:id" => "prayers#destroy"

  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"
end
