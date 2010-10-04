Railsjam::Application.routes.draw do

  match 'logout', :to => 'user_sessions#destroy', :as => "logout"
  match 'login', :to => 'user_sessions#new', :as => "login"
  match 'not_found', :to=>"home#page_not_found", :as=>"not_found"

  


  resources :attachments 
  resources :events
  resources :events do
    resource :attendees
  end

  resources :users
  match '/signup', :to => 'users#new'
  
  match 'account', :to=>'users#edit'

  resources :posts
  resources :pages
  resource :user_session
  
  resources :password_resets
  
  resources :galleries 
  resources :photos 
  
  resources :sponsors
  
  resources :sponsors do
     resources :photos    
  end
  
  
  resources :galleries do
    resources :photos 
  end
  
  resources :presentations 
 
  
  get "home/index"

  match 'blog/:id', :to=> 'posts#show'
  match ':id', :to=> 'pages#show', :id=>nil
    
    
    
  resources :home
  root :to => "home#index"

end
