class MembersController < ApplicationController
  include MembersHelper
  before_action :redirect_if_not_logged_in
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :redirect_to_home_if_not_admin, 
    only: [:index,
           :new_admin,
           :create_admin,
           :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    new_helper
  end

  def new_admin
    new_helper
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    create_helper false
  end

  def create_admin
    create_helper true
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    if @member.email == "admin@admin.com"
      redirect_to logged_in_user, notice: "Cannot Delete SuperUser."
    else
      @member.destroy
      respond_to do |format|
        format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:email, :name, :password, :admin)
    end

    def create_helper (admin)
      if params[:member][:password] != params[:member][:confirm_password]
        redirect_to new_member_path, notice: 'Mismatch in Passwords. Please try again.'
      else
        @member = Member.new(member_params)
        @member.admin = admin

        if @member.save
          if @member.admin
            redirect_to logged_in_user, notice: "Admin was successfully created."
          else
            log_in @member.id
            redirect_to logged_in_user, notice: "Member was successfully created."
          end
        else
          render :new
        end
      end
    end

    def new_helper
      @member = Member.new
    end


end
