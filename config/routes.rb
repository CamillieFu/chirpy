Rails.application.routes.draw do
  get 'dashboard/index'
  post 'kids/:id/', to: 'kids#add', as: "add_word"
  # ask about where this route should be to avoid confusion with kids#destroy
  # need help with route - not connecting
  delete 'kids/:id/:word', to: 'kids#remove', as: "remove_word"
  devise_for :users
  root to: 'pages#home'
  get 'pages/support'

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
      resources :pages, only: %i[create]
      resources :statistics, only: %i[create]
    end
  end
end
