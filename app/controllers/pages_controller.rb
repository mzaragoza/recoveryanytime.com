class PagesController < PublicController
  layout :choose_layout

  expose(:user){User.new}

  def ping
    render :layout => false
  end


  def choose_layout
    'public/default'
  end
end

