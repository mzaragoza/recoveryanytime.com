class PagesController < PublicController
  before_filter :redirect_if_logged_in
  layout :choose_layout

  expose(:user){User.new}
  expose(:resource_name){:user }
  expose(:resource){ User.new }
  expose(:devise_mapping){ Devise.mappings[:user] }

  def ping
    render :layout => false
  end


  def choose_layout
    'public/default'
  end

  private
  def redirect_if_logged_in
    if user_signed_in?
      flash[:notice] = 'You must sign out first!'
      redirect_to users_root_path
    end
  end

end

