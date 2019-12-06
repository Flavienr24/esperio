Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  resources :companies

  devise_scope :user do
    resources :users, except: :destroy
    root to: "devise/sessions#new"
  end


  resources :projects, except: :destroy do
    resources :collaborations
  end
end
