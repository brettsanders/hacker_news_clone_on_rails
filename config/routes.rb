RailsHackerNews::Application.routes.draw do
  #USER ROUTES
  root to: 'pages#index', as: 'homepage'
  resources :users, except: [:index]
  get '/login', to: 'sessions#new'


  #SESSION ROUTES
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  #POST ROUTES
  resources :posts do
    get 'vote_up', to: 'votes#post_vote_up'
    get 'vote_down', to: 'votes#post_vote_down'
  #COMMENT ROUTES
    resources :comments, except: [:index] do
      get 'vote_up', to: 'votes#comment_vote_up'
      get 'vote_down', to: 'votes#comment_vote_down'
    end
  end
end
