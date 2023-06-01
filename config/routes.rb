Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  
  devise_scope :user do  
    get '/users/sign_out' => 'devise/sessions#destroy'     
  end

  # scope "/:locale" do
  #   resources :users do 
  #     resources :topics
  #   end
  # end

  # resources :topics 
  resources :users

  resources :users do
    resources :topics do
      resources :likes
    end
  end

  resources :likes  
  
  resources :topics do 
    resources :comments
  end

  resources :users do
    resources :friendships
  end

  resources :friendships do
    member do
      get :delete
    end
  end

  resources :topics do
    member do
      get :show
    end
  end
  get '/users/', to: "users#show"
end
