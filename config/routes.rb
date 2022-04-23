Rails.application.routes.draw do
  resources :posts
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  get 'users/:id', to: 'users#show', as: 'profile'
  root 'home#index'
  post 'users/your_posts', to:'users#your_posts', as: 'your_posts'
end
