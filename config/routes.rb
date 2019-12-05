# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/notadmin', as: 'rails_admin'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "api/graphql", to: "graphql#execute"

  authenticated :user do
    root to: 'dashboards#dashboard_2'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'live#index'

  get '/live', to: 'live#index'
  get 'dashboards/dashboard_2'
  get 'landing/index'
  get 'privacy', to: 'landing#privacy'
  get 'terms_of_service', to: 'landing#terms_of_service'
  get '/settings', to: 'users#settings'


  resources :acquired_certifications, only: [:create, :destroy, :update, :edit, :new]
  resources :certifications, only: [:index, :create, :destroy, :update, :edit, :new]
  resources :job_board, only: [:index]
  resources :work_histories, only: [:create, :destroy]
  resources :locations

  resource :subscription, only: [:new, :destroy, :create] do
    get :reactivate
  end

  resource :users, only: [] do
    get :auth
  end

  resources :users, only: [:update, :edit] do
    get :work_histories
    get :certifications
  end

end
