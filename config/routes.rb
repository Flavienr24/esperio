Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :companies

  devise_scope :user do
    resources :users, except: :destroy
  end


  post "user/get_researchgate_info", to: "scrapings#get_user_information"


  resources :projects, except: :destroy do
    resources :collaborations
  end
end
