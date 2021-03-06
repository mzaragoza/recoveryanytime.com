class PagesController < PublicController
  #before_filter :redirect_if_logged_in
  layout :choose_layout

  expose(:user){User.new}
  expose(:resource_name){:user }
  expose(:resource){ User.new }
  expose(:devise_mapping){ Devise.mappings[:user] }
  expose(:treatments){            Facility.is_active.treatment.order(            'RANDOM() ').limit(4) }
  expose(:detox){                 Facility.is_active.detox.order(                'RANDOM() ').limit(4) }
  expose(:sober_living){          Facility.is_active.sober_living.order(         'RANDOM() ').limit(4) }
  expose(:intensive_outpatient){  Facility.is_active.intensive_outpatient.order( 'RANDOM() ').limit(4) }
  expose(:interventionists){      Facility.is_active.interventionists.order(     'RANDOM() ').limit(4) }
  expose(:outpatient_detox){      Facility.is_active.outpatient_detox.order(     'RANDOM() ').limit(4) }

  def ping
    render :layout => false
  end

  def choose_layout
    'public/default'
  end

  def promotion_click
    p = Promotion.find(params[:id])
    if current_user
      p.add_to_clicks({:user_id => current_user.id, :action => 'click', :referer => params[:referer]})
    else
      p.add_to_clicks({:action => 'click', :referer => params[:referer]})
    end
    redirect_to p.link
  end

  def facility_click
    f = Facility.find(params[:id])
    if current_user
      f.add_to_clicks({:user_id => current_user.id, :action => 'click', :referer => params[:referer]})
    else
      f.add_to_clicks({:action => 'click', :referer => params[:referer] })
    end
    redirect_to f.link
  end
  private
  def redirect_if_logged_in
    if user_signed_in?
      flash[:notice] = 'You must sign out first!'
      redirect_to users_root_path
    end
  end

end

