Rails.application.routes.draw do

  namespace :api do

    namespace :v1 do
      resources :sessions, only: [] do
        collection do
          post :login
          post :register
          post :reset_password
        end
      end

      resources :users, only: [:index] do
        collection do
          put :change_info
        end
      end

      resources :shopping_carts, only: [:index, :create, :destroy]

      resources :orders, only: [:create, :show, :destroy, :index] do
        collection do
          post :valid_voucher
          post :apply_voucher
          post :transaction_as_pending
          post :transaction_as_processing
        end
      end

      resources :categories, only: [:index, :show]

      resources :flowers, only: [:show, :index]

      resources :vars do
        collection do
          get :color
        end
      end

      resources :comments, only: [:create, :index]

      resources :vouchers, only: [:index]

    end

    namespace :admin do

      resources :sessions, only: [] do
        collection do
          post :login
        end
      end

      resources :categories, only: [:create, :index, :show, :update]

      resources :flowers, only: [:create, :update, :index, :show]

      resources :vouchers, only: [:create, :update, :index, :show]

      resources :buds, only: [:create, :index]

      resources :users, only: [:index, :create]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
