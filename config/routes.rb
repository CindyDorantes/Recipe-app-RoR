Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'recipes#index'
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :recipe_foods, only: [:index, :new, :create]
  end
  get 'shopping_list', to: 'shopping_list#index', as: 'shopping_list'
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  
end
