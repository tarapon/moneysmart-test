Rails.application.routes.draw do
  resources :urls, path: '', only: [:index, :create, :show]
  resources :visitors, only: :show
end
