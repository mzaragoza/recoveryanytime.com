class PagesController < PublicController
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






  module ContentHelper
  end
end

