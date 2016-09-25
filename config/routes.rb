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
  post 'bookings/new_history_for_selection', to: 'bookings#prepare_history_for_selection'
  get 'bookings/history_for_selection'

  get 'bookings/new_history_for_room'
  post 'bookings/new_history_for_room', to: 'bookings#prepare_history_for_room'
  get 'bookings/history_for_room'
  
  get 'bookings/history_for_current'

  get 'bookings/edit_by_admin'
  put 'bookings/edit_by_admin', to: 'bookings#update_by_admin'
  patch 'bookings/edit_by_admin', to: 'bookings#update_by_admin'

  get 'bookings/new_room_by_size'
  post 'bookings/new_room_by_size', to: 'bookings#create_room_by_size'
  get 'bookings/book_by_size'
  post 'bookings/book_by_size', to: 'bookings#create_book_by_size'

  get 'bookings/new_room_by_building'
  post 'bookings/new_room_by_building', to: 'bookings#create_room_by_building'
  get 'bookings/book_by_building'
  post 'bookings/book_by_building', to: 'bookings#create_book_by_building'

  resources :bookings

  resources :rooms

  get 'members/new_admin'
  post 'members/new_admin', to: 'members#create_admin'
  get 'members/index_admin'
  resources :members

end
