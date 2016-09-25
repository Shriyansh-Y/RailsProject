class BookingsController < ApplicationController
  include BookingsHelper
  before_action :redirect_if_not_logged_in
  before_action :set_booking, only: [:show, :edit, :update, :destroy, :update_by_admin]
  before_action :redirect_to_home_if_not_admin, 
    only: [:index,
           :new_history_for_room,
           :prepare_history_for_room,
           :history_for_room,
           :new_history_for_selection,
           :new_by_admin,
           :edit_by_admin,
           :update_by_admin,
           :create_by_admin]


  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  def history_for_current
    @bookings = Booking.where(member_id: logged_in_user.id)
  end

  def new_history_for_room
    @booking = Booking.new
  end

  def prepare_history_for_room
    redirect_to bookings_history_for_room_path(params[:booking][:room_id])
  end

  def history_for_room
    # this method expects the room id to be sent from the caller.
    @bookings = Booking.where(room_id: params[:format])
  end

  def new_history_for_selection
    @booking = Booking.new
  end

  def prepare_history_for_selection
    redirect_to bookings_history_for_selection_path(params[:booking][:member_id])
  end

  def history_for_selection
    # this method expects the room id to be sent from the caller.
    @bookings = Booking.where(member_id: params[:format])
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  def new_by_admin
    @booking = Booking.new
  end

  def new_room_by_size
    @booking = Booking.new
  end

  def create_room_by_size
    redirect_to bookings_book_by_size_path(Room.find(params[:booking][:room_id]).capacity)
  end

  def book_by_size
    @booking = Booking.new
    @rooms = Room.where(capacity: params[:format])
  end

  def create_book_by_size
    create_helper bookings_new_room_by_size_path
  end

  def new_room_by_building
    @booking = Booking.new
  end

  def create_room_by_building
    redirect_to bookings_book_by_building_path(Room.find(params[:booking][:room_id]).building)
  end

  def book_by_building
    @booking = Booking.new
    @rooms = Room.where(building: params[:format])
  end

  def create_book_by_building
    create_helper bookings_new_room_by_building_path
  end

  # GET /bookings/1/edit
  def edit
  end

  def edit_by_admin
    @booking = Booking.find(params[:format])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    create_helper new_booking_path
  end

  def create_by_admin
    create_helper bookings_new_by_admin_path
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_by_admin
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:room_id, :member_id, :booking_start_year, :booking_start_month, :booking_start_day, :booking_start_hour)
    end

    def create_helper (path_to_new)
      booking_hash = params[:booking]
      if time_validator booking_hash[:booking_start_year], booking_hash[:booking_start_month], booking_hash[:booking_start_day], booking_hash[:booking_start_hour]
        @booking = Booking.new(booking_params)

        respond_to do |format|
          if @booking.save
            format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
            format.json { render :show, status: :created, location: @booking }
          else
            format.html { render :new }
            format.json { render json: @booking.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to path_to_new, notice: 'Past Time Provided'
      end
    end


end
