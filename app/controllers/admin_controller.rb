class AdminController < ApplicationController
  before_filter :authenticate_admin!
  layout 'admins/default'
  before_filter :check_admin_active

  private
  def check_admin_active
    unless current_admin.active
      flash[:notice]= t(:admin_not_active)
      sign_out current_admin
      redirect_to root_path
    end
  end
end

