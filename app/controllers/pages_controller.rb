class PagesController < PublicController
  layout :choose_layout

  def ping
    render :layout => false
  end


  def choose_layout
    'public/default'
  end
end

