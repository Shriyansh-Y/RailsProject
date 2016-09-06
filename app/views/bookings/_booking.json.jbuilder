json.extract! booking, :id, :room_id, :member_id, :booking_start, :created_at, :updated_at
json.url booking_url(booking, format: :json)