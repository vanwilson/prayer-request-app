Rails.application.routes.draw do
  get "/prayers" => "prayers#index"
  post "/prayers" => "prayers#create"
end
