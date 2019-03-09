Rails.application.routes.draw do

  get 'client_works/new'

  get 'client_works/create'

  get 'client_works/edit'

  get 'client_works/update'

  get 'client_works/delete'

  get 'client_works/show'

  get 'client_works/index'

   root 'users#index'

  devise_for :users

  resources :users ,only: [:index, :show]

  resources :users ,only: [:new, :create] do
    resources :user_works ,only: [:new, :create,:destroy, :edit]
  end


   resources :users ,only: [:new, :create] do
    resources :daily_reports ,only: [:new, :create,:destroy, :edit]
  end

    resources :clients ,only: [:new, :create,:destroy, :edit,:index, :show]

    resources :clients ,only: [:new, :create,:destroy, :edit] do
      resources :client_works ,only: [:new, :create,:destroy, :edit]
    end

    resources :users ,only: [:new, :create,:destroy, :edit] do
      resources :user_works ,only: [:new, :create,:destroy, :edit]
    end
resources :companies ,only: [:show, :edit,:update ]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
