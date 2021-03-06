Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do

    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"

    get "/causes" => "causes#index"
    post "/causes" => "causes#create"
    get "/causes/:id" => "causes#show"
    
    get "/products" => "products#index"
    # get "/products/new" => "products#new"
    post "/products" => "products#create"
    get "/products/:id" => "products#show"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
    
    get "/orders" => "orders#index"
    post "/orders" => "orders#create"
    get "/orders/:id" => "orders#show"

    get "/carted_products" => "carted_products#index"
    post "/carted_products" => "carted_products#create"
    delete "/carted_products/:id" => "carted_products#destroy"


    
  end

  root 'application#index'
  get '/*path', to: 'application#index'
end
