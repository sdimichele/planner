Rails.application.routes.draw do
  namespace :api do
    get "/children" => "children#index"
    post '/children' => 'children#create'
    get '/children/:id' => 'children#show'
    patch '/children/:id' => 'children#update'
    delete '/children/:id' => 'children#destroy'

    get "/children_tasks" => "children_tasks#index"
    post '/children_tasks' => 'children_tasks#create'
    get '/children_tasks/:id' => 'children_tasks#show'
    patch '/children_tasks/:id' => 'children_tasks#update'
    delete '/children_tasks/:id' => 'children_tasks#destroy'

    get "/contacts" => "contacts#index"
    post '/contacts' => 'contacts#create'
    get '/contacts/:id' => 'contacts#show'
    patch '/contacts/:id' => 'contacts#update'
    delete '/contacts/:id' => 'contacts#destroy'
    
    get "/users" => "guardians#index"
    post '/users' => 'guardians#create'
    get '/users/:id' => 'guardians#show'
    patch '/users/:id' => 'guardians#update'
    delete '/users/:id' => 'guardians#destroy'
    post "/sessions" => "sessions#create"

    get "/relationships" => "relationships#index"
    post '/relationships' => 'relationships#create'
    get '/relationships/:id' => 'relationships#show'
    patch '/relationships/:id' => 'relationships#update'
    delete '/relationships/:id' => 'relationships#destroy'

    get "/tasks" => "tasks#index"
    post '/tasks' => 'tasks#create'
    get '/tasks/:id' => 'tasks#show'
    patch '/tasks/:id' => 'tasks#update'
    delete '/tasks/:id' => 'tasks#destroy'
  end
  
end
