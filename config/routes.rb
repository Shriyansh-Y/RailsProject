Rails.application.routes.draw do

  get 'welcomes/login'
  get 'trackers/login', to: 'trackers#new'
  post 'trackers/login', to: 'trackers#create'
  get 'tracker/logout', to: 'trackers#destroy'
  get 'welcomes/home'
  resources :bookings
  resources :rooms
  resources :members
  root 'welcomes#login'

end
