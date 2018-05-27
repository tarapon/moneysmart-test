Rails.application.routes.draw do
  resources :urls, path: '', only: [:index, :create, :show]
end
