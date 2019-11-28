Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: { registrations: "registrations" }
  get 'dashboard/index'
  #Below line to map /dashboard to /dashboard/index
  get "/dashboard" => "dashboard#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :study_groups do
      collection do
        post 'attend'
      end
      collection do
        post 'unattend'
      end
      collection do
        post 'unattend_from_dash'
      end
    end
    resources :tutors do
      collection do
        post 'hire'
      end
    end
    resources :notes do
      resources :comments do
        collection do
          post 'add'
        end
      end
      collection do
        post 'add'
      end
    end
    collection do
      post 'add'
    end
  end
  
  resources :users


  get 'study_groups/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  
  resources :charges, only: [:new, :create, :show] do
    collection do
      get 'checkout'
    end
  end

end
