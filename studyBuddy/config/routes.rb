Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: "registrations" }
  get 'dashboard/index'
  #Below line to map /dashboard to /dashboard/index
  get "/dashboard" => "dashboard#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :study_groups
    collection do
      post 'add'
    end
  end

  get 'study_groups/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



end
