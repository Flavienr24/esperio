Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  authenticated :user do
    root 'users#my_profile', as: :authenticated_root
  end


  resources :companies

  devise_scope :user do
    resources :users, except: [:edit, :update, :destroy]
    get '/users/:id', to: 'user#show', as: :user_profile
    root to: "devise/sessions#new"
  end

  post "user/get_researchgate_info", to: "scrapings#get_user_information"

  resources :projects, except: :destroy do
    resources :collaborations
    resources :posts, except: [:update, :destroy]
  end

  get "test_page", to: "pages#test_page"

end
