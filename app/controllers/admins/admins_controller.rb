class Admins::AdminsController < AdminController
  before_filter :check_password_submitted, :only => :update
  expose(:admins){ Admin.order("id DESC").scoped{} }
  expose(:admin, attributes: :admin_params)

  def create
   if admin.save
     flash[:notice] = t(:admin_was_successfully_created)
     redirect_to(admins_admins_path)
   else
     render :new
   end
  end

  def update
    if admin.save
      flash[:notice] = t(:admin_was_successfully_updated)
      redirect_to(admins_admins_path)
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
      :email,
      :password,
      :password_confirmation,
      :first_name,
      :last_name,
      :phone,
      :start_date,
      :end_date,
      :active,
      :send_sms,
    )
  end
end


