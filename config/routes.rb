Rails.application.routes.draw do

  # Welcome Page.
  get 'trackers/login'

  # Sign In get Page.
  get 'trackers/new'

  # Sign in Post page
  post 'trackers/new', to: 'trackers#create'

  # Sign out page.
  get 'tracker/logout', to: 'trackers#destroy'

  root 'trackers#login'
  resources :bookings
  resources :rooms
  get 'members/new_admin'
  post 'members/new_admin', to: 'members#create_admin'
  resources :members

end
