Rails.application.routes.draw do
  devise_for :users, controllers: {
    :registrations => 'users/registrations'
  }

  authenticated :user do
    resources :courses do
      resources :groups do
        resources :group_students, path: :students
      end
    end
  end

  root to: 'home#index'
end