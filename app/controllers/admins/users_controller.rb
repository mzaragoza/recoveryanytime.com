class Admins::UsersController < AdminController
  expose(:users){ Users.order("username ASC").scoped{} }
  expose(:user, attributes: :user_params)

  def create
    if user.save
      flash[:notice] = t(:user_was_successfully_created)
      redirect_to admins_users_path
    else
      render :new
    end
  end
  def update
    if user.save
      flash[:notice] = t(:user_was_successfully_updated)
      redirect_to admins_users_path
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
      :username,
      :email,
      :encrypted_password,
      :first_name,
      :last_name,
      :gender,
      :address,
      :city,
      :state,
      :zip,
      :recovery_type,
      :phone,
      :photo,
      :agree_newsletter,
    )
  end
end

