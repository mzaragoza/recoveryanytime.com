class Users::FellowshipUsersController < UserController
  expose(:user){ User.find(params[:id]) }
  expose(:fellowship_user){ user }
  expose(:fellowships){ Fellowship.is_active.order("name ASC").scoped{} }

  def edit
    if user != current_user
      # to do Email Managment that a user is trying to update another users info
      redirect_to users_profile_path(user)
    end
  end
  def update
    fellowships.each do |f|
      if params[:fellowship]["#{f.id}"].to_s.empty?
        fu = FellowshipUser.find_or_create_by_fellowship_id_and_user_id(f.id, current_user.id)
        fu.opt_in = false
        fu.save
      else
        fu = FellowshipUser.find_or_create_by_fellowship_id_and_user_id(f.id, current_user.id)
        fu.opt_in = true
        fu.save
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


