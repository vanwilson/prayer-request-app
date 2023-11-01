Rails.application.routes.draw do
  get "/prayers" => "prayers#index"
  post "/prayers" => "prayers#create"
  get "/prayers/:id" => "prayers#show"
  patch "/prayers/:id" => "prayers#update"
  delete "/prayers/:id" => "prayers#destroy"
end
