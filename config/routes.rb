Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :companies

  resources :users, except: :destroy

  resources :projects, except: :destroy do
    resources :collaborations
  end
end
