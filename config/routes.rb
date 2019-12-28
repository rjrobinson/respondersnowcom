# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/notadmin', as: 'rails_admin'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  post "api/graphql", to: "graphql#execute"

  authenticated :user do
    root to: 'private#index'
    # TODO change this to 'dashboards#responder' to avoid confusion in the future
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  scope :u do
    get '/certifications', to: 'users#certifications'
    resources :certifications, only: [:create, :new]
    get '/settings', to: 'users#settings'
  end

  root to: 'public#index'

  get '/live', to: 'live#index'

  get 'privacy', to: 'landing#privacy'
  get 'terms_of_service', to: 'landing#terms_of_service'

  resources :locations

  # resource :agencies, only: [] do
  #   get :autocomplete_agency_name, on: :collection
  # end

  get '/settings', to: 'users#settings'

  resource :users, only: [] do
    get :auth
  end

  resources :users, only: [:update, :edit] do
    get :work_histories
    get :certifications
  end

  resource :subscriptions, only: [:new, :destroy, :create] do
    get :reactivate
  end

  resources :job_board, only: [:index]

  resources :work_histories, only: [:create, :destroy]

  resources :certifications, only: [:index, :destroy, :update, :edit]

  resources :acquired_certifications, only: [:create, :destroy, :update, :edit, :new]

  # All routes
  get 'dashboards/dashboard_1'
  get 'dashboards/dashboard_2'
  get 'dashboards/dashboard_3'
  get 'dashboards/dashboard_4'
  get 'dashboards/dashboard_4_1'
  get 'dashboards/dashboard_5'

  get 'landing/index'

  # Wildcard to capture React managed routes
  match '*path', to: 'public#index', via: :all
  match '*path', to: 'private#index', via: :all, constraints: -> { current_user }
end
