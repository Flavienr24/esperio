Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :companies

  devise_scope :user do
    resources :users, except: [:edit, :update, :destroy]
  end

  resources :projects, except: :destroy do
    resources :collaborations
  end
end
