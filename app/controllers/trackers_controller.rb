class TrackersController < ApplicationController

  def login
   redirect_to_home_if_logged_in
  end

  def new
   redirect_to_home_if_logged_in
  end

  def create
    @member = Member.find_by(email: params[:tracker][:email].downcase)
    if @member
      if @member.authenticate(params[:tracker][:password])
        log_in @member.id
        redirect_to @member
      else
        redirect_to trackers_new_path, notice: "Wrong password. Please try again #{params[:tracker][:is_admin]}"
      end
    else
      redirect_to trackers_new_path, notice: 'Please check the E-mail address. E-mail address not regiested in the system'
    end
  end

  def destroy
    session.delete(:id)
    redirect_to trackers_login_path, notice: 'You have successfully logged out'
  end

end
