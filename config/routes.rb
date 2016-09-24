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
  get 'members/newadmin'
  post 'members/newadmin', to: 'members#createadmin'
  resources :members

end
