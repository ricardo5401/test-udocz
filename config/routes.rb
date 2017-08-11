Rails.application.routes.draw do
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get "/home"             => 'pages#index'
  get "/conditions"       => "pages#conditions", as: 'terms_and_conditions'
  get "/privacy_policy"   => "pages#privacy_policy"
  get "/copyright"        => "pages#copyright"
  get "/faq"							=> "pages#faq"
  get '/upload'           => 'documents#upload'
  get '/profile/:user'    => 'users#show' 
  get '/notifications'    => 'users#notifications' 
  get '/search'           => 'searches#index'
  get '/read/:title_url'  => 'documents#read'   
end
