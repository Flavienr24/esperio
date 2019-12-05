Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  root'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :companies

  devise_scope :user do
    resources :users, except: :destroy
  end

  resources :projects, except: :destroy do
    resources :collaborations
  end
end
