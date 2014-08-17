class Admins::ProfileController < AdminController
  before_filter :check_password_submitted, :only => :update
  expose(:admin){ Admin.find(params[:id]) }

  def edit
    if admin != current_admin
      # to do Email Managment that a user is trying to update another users info
      redirect_to admins_profile_path(admin)
    end
  end
  def update
    if admin.update_attributes(admin_params)
      sign_in(current_admin, :bypass => true)
      admin.save
      flash[:notice] = t(:profile_was_successfully_updated)
      redirect_to admins_root_path
    else
      render :edit
    end
  end

  private
  def check_password_submitted
    if params[:admin][:password].blank?
      params[:admin].delete("password")
      params[:admin].delete("password_confirmation")
      admin.updating_password = false
    else
      admin.updating_password = true
    end
  end

  def admin_params
    params.require(:admin).permit(
      :first_name,
      :last_name,
      :phone,
      :gender,
      :address,
      :city,
      :state,
      :zip,
      :photo,
    )
  end
end
