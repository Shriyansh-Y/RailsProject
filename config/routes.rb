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

  get 'bookings/new_by_admin'
  post 'bookings/new_by_admin', to: 'bookings#create_by_admin'

  get 'bookings/new_history_for_selection'
  post 'bookings/new_history_for_selection', to: 'bookings#history_with_selection'

  get 'bookings/new_history_for_room'
  post 'bookings/new_history_for_room', to: 'bookings#history_for_room'
  
  get 'bookings/history_for_current'
  resources :bookings
  resources :rooms
  get 'members/new_admin'
  post 'members/new_admin', to: 'members#create_admin'
  resources :members

end
