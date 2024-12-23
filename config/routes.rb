Rails.application.routes.draw do
  # Devise user authentication routes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Custom logout route for Devise with JSON API
  # devise_scope :user do
  #   delete 'users/sign_out', to: 'users/sessions#destroy', as: :logout
  # end

  # Health check endpoint for load balancers
  get "up" => "rails/health#show", as: :rails_health_check

  # API Routes under version 1
  namespace :api do
    namespace :v1 do
      resources :challenges do
        collection do
          get :active_and_upcoming
          get :current_user_info
        end
      end
    end
  end
  # Define the root path (optional)
  # root "posts#index"
end
