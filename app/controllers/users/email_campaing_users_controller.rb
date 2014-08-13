class Users::EmailCampaingUsersController < UserController
  expose(:user){ User.find(params[:id]) }

  def edit
    if user != current_user
      # to do Email Managment that a user is trying to update another users info
      redirect_to users_profile_path(user)
    end
  end
  def update
  # if user.update_attributes(user_params)
  #   sign_in(current_user, :bypass => true)
  #   flash[:notice] = t(:profile_was_successfully_updated)
  #   redirect_to users_profile_path(user)
  # else
  #   render :edit
  # end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :active,
      :is_admin,
      :is_owner,
      :account_id,
      :first_name,
      :last_name,
      :phone,
      :photo
    )
  end
end

