Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }

  authenticated :user do
    resources :courses do
      resources :groups do
        get 'addStudent'
        post 'updateAddStudent'
      end
    end
  end

  root to: 'home#index'
end