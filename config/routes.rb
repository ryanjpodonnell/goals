Expectation::Application.routes.draw do
  root to: 'goals#index'
  resources :users do
      resources :comments, :only => [:new, :create, :destroy]
  end
  resource :session
  resources :goals do
    member { post "complete" }
    resources :comments, :only => [:new, :create, :destroy]
  end



end
