Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root 'users#show', as: :authenticated_root
  end

  resources :companies

  devise_scope :user do
    resources :users, except: [:edit, :update, :destroy]
    root to: "devise/sessions#new"
  end

  post "user/get_researchgate_info", to: "scrapings#get_user_information"

  resources :projects, except: :destroy do
    resources :collaborations
  end
end
