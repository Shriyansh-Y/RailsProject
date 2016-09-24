module MembersHelper

  def create_helper (admin)
    if params[:member][:password] != params[:member][:confirm_password]
      redirect_to new_member_path, notice: 'Mismatch in Passwords. Please try again.'
    else
      @member = Member.new(member_params)
      @member.admin = admin

        byebug
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
