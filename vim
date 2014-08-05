class UserController < ApplicationController
  before_filter :authenticate_user!
  layout 'users/default'
  before_filter :check_user_active
  expose(:new_applications){ current_account.applications.where(:status => 'new') }
  expose(:approved_applications){ current_account.applications.where(:status => 'approved') }
  expose(:denied_applications){ current_account.applications.where(:status => 'denied') }
  expose(:draft_applications){ current_account.applications.where(:status => 'draft') }

  expose(:active_facilities){ current_account.facilities.where(:active => true) }
  expose(:active_users){ current_account.users.where(:active => true) }
  expose(:active_residents){ current_account.residents.where(:active => true) }
  expose(:inactive_residents){ current_account.residents.where(:active => false) }

  expose(:new_contacts){ current_account.facility_contacts.where(:status => 'new') }
  expose(:approved_contacts){ current_account.facility_contacts.where(:status => 'approved') }
  expose(:denied_contacts){ current_account.facility_contacts.where(:status => 'denied') }

  private
  def check_user_active
    unless current_user.active
      flash[:notice]= t(:user_not_active)
      sign_out current_user
      redirect_to new_user_session_path
    end
  end
end

