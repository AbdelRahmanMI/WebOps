Rails.application.routes.draw do
  resources :posts do
    resources :comments , only: [:create]
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  get 'users/:id', to: 'users#show', as: 'profile'
  root 'posts#index'
  post 'users/your_posts', to:'users#your_posts', as: 'your_posts'
end
