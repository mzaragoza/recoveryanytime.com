class AdminController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admins/default'
  before_filter :check_admin_active
  expose(:last_users){
    User.is_active.order("last_sign_in_at DESC").limit(1000)
  }

  private
  def check_admin_active
    unless current_admin.active
      flash[:notice]= t(:admin_not_active)
      sign_out current_admin
      redirect_to root_path
    end
  end
end

