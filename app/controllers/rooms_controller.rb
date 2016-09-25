class RoomsController < ApplicationController
  include RoomsHelper
  before_action :redirect_if_not_logged_in
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_home_if_not_admin, 
    only: [:index,
           :new,
           :edit,
           :create,
           :update,
           :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all

    @rooms_status_hash = {}
    year, month, day, hour = base_time_for_slot

    @rooms.each do |room|
      if is_room_available? room.id, year, month, day, hour
        @rooms_status_hash[room.id] = "Available"
      else
        @rooms_status_hash[room.id] = "Booked"
      end
    end

  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show

    year, month, day, hour = base_time_for_slot
    if is_room_available? @room.id, year, month, day, hour
      @status = "Available"
    else
      @status = "Booked"
    end
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:room_number, :capacity, :building)
    end

    def is_room_available? (id, year, month, day, hour)
      Booking.find_by(room_id: id,
                      booking_start_hour: hour,
                      booking_start_day: day,
                      booking_start_month: month,
                      booking_start_year: year).nil?
    end
end
