Rails.application.routes.draw do
  namespace :client do

    get "/signup" => "users#new"
    
    post "/users" => "users#create"
    get "/users" => "users#new"

    get "/users/:id" => "users#show"
    
    patch "/users/:id" => "users#update"
    


    get "/measurements/:id" => "measurements#show"

    get "/measurements" => "measurements#new"

    post "/measurements" => "measurements#create"

    patch "/measurements/:id" => "measurements#update"

    delete "/measurements/:id" => "measurements#destroy"



    get "/login" => "sessions#new"

    post "/login" => "sessions#create"

    delete "/logout" => "sessions#destroy"

    patch "/pattern/:id" => "pattern#update"

  end

end
