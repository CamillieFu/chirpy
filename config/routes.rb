Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  root to: 'pages#home'
  resources :dashboards, only: :index
  resources :kids do
    resources :dictionaries do
      resources :suggestions
      # might make sense to have the suggestions on the dictionary page
      # and then when selected immediately pushed into the dictionary words array
      # so i nested it here - but can be changed depending on our page layout
    end
  end
  resources :articles, only: %i[index show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :statistics, only: %i[create]
    end
  end
end
