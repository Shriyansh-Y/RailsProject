class TrackersController < ApplicationController
  def new
  end
  def create
      @member = Member.find_by(email: params[:tracker][:email])
      if @member
        if @member.authenticate(params[:tracker][:password])
          redirect_to @member
        else
          redirect_to trackers_new_path, notice: 'Wrong password. Please try again'
        end
      else
        # TODO - Update the text
        redirect_to trackers_new_path, notice: 'Please check the E-mail address. E-mail address not regiested in the system'
      end
  end
end
