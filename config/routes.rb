Rails.application.routes.draw do
  # get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # root_pathにアクセスするとpages controllerのpages#indexアクションに飛ぶ
  root 'pages#index'
  # controllerのアクション↓
  resources :user, only: [:new, :create, :show ]
  
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  
  get 'sessions/new'
  get 'users/new'
  
  resources :candle_sticks do
    collection do
      get :candlestick_chart
    end
  end
  
  
end
