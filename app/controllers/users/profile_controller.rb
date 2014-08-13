class Users::ProfileController < UserController
  before_filter :check_password_submitted, :only => :update
  expose(:user){ User.find(params[:id]) }

  def edit
    if user != current_user
      # to do Email Managment that a user is trying to update another users info
      redirect_to users_profile_path(user)
    end
  end
  def update
    if user.update_attributes(user_params)
      sign_in(current_user, :bypass => true)
      unless params[:user][:sober_date].to_s.empty?
        date = params[:user][:sober_date].split("/")
        date = date[1] + '/' + date[0] + '/' + date[2]
        user.sober_date = date
      end
      unless params[:user][:birthday].to_s.empty?
        date = params[:user][:birthday].split("/")
        date = date[1] + '/' + date[0] + '/' + date[2]
        user.birthday = date
      end
      user.save
      flash[:notice] = t(:profile_was_successfully_updated)
      redirect_to users_profile_path(user)
    else
      render :edit
    end
  end

  private
  def check_password_submitted
    if params[:user][:password].blank?
      params[:user].delete("password")
      params[:user].delete("password_confirmation")
      user.updating_password = false
    else
      user.updating_password = true
    end
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone,
      :gender,
      :address,
      :city,
      :state,
      :zip,
      :photo,
      :sober_date,
      :birthday,
    )
  end
end


