class UserController < ApplicationController
  before_filter :authenticate_user!
  layout 'users/default'
  before_filter :check_user_active

  expose(:last_users){
    User.is_active.where.not(id: current_user.id).order("id DESC").limit(10)
  }
  private
  def check_user_active
    unless current_user.active
      flash[:notice]= t(:user_not_active)
      sign_out current_user
      redirect_to new_user_session_path
    end
  end
end

