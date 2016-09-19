Rails.application.routes.draw do

  get 'trackers/new'
  post 'trackers/new', to: 'trackers#create'
  get 'welcomes/login'
  get 'welcomes/home'
  resources :bookings
  resources :rooms
  resources :members
  root 'welcomes#login'

end
