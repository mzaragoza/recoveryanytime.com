class Users::EmailCampaingUsersController < UserController
  expose(:user){ User.find(params[:id]) }
  expose(:email_campaing_user){ user }

  def edit
    if user != current_user
      # to do Email Managment that a user is trying to update another users info
      redirect_to users_profile_path(user)
    end
  end
  def update
    email_campaings.each do |ec|
      if params[:ec]["#{ec.id}"].to_s.empty?
        ecu = EmailCampaingUser.find_or_create_by_email_campaing_id_and_user_id(ec.id, current_user.id)
        ecu.opt_in = false
        ecu.save
      else
        ecu = EmailCampaingUser.find_or_create_by_email_campaing_id_and_user_id(ec.id, current_user.id)
        ecu.opt_in = true
        ecu.save
      end
    end
    flash[:notice] = t(:profile_was_successfully_updated)
    redirect_to users_profile_path(user)
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

