class Users::RegistrationsController < Devise::RegistrationsController

  layout :choose_layout
  expose(:selected_plan) { Plan.find_by_slug(params[:plan]) }

  #after_filter :after_registration, :only => [:create]

  def choose_layout
    if params[:action] == 'edit' or params[:action] =='update' or params[:action] =='change_password'
      'users/default'
    else
      'users/login'
    end
  end

  def new
    redirect_to user_root_path if current_user
    resource = build_resource({})
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    if resource.save
      unless params[:user][:sober_date].to_s.empty?
        date = params[:user][:sober_date].split("/")
        date = date[1] + '/' + date[0] + '/' + date[2]
        resource.sober_date = date
      end
      unless params[:user][:birthday].to_s.empty?
        date = params[:user][:birthday].split("/")
        date = date[1] + '/' + date[0] + '/' + date[2]
        resource.birthday = date
      end
      resource.save
      yield resource if block_given?
      set_email
      if resource.active_for_authentication?
        #resource.post_sign_up
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        #set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      render :action => 'new'
      #respond_with({}, :location => after_sign_up_fails_path_for(resource))
    end
  end

  def after_inactive_sign_up_path_for(resource)
    edit_users_email_campaing_user_path(resource)
  end

  def after_sign_up_fails_path_for(resource)
    new_user_registration_path
  end

  def after_sign_up_path_for(resource)
    session[:just_registered] = true
    sign_in(resource)
    edit_users_email_campaing_user_path(resource)
  end

  private

  def set_email
    email_campaings.each do |ec|
      ecu = EmailCampaingUser.find_or_create_by_email_campaing_id_and_user_id(ec.id, resource.id)
      ecu.opt_in = false
      ecu.save
    end
  end
  def sign_up_params
    params.require(resource_name).permit(
      :username,
      :email,
      :password,
      :first_name,
      :last_name,
      :gender,
      :address,
      :city,
      :state,
      :zip,
      :recovery_type,
      :phone,
      :photo,
      :sober_date,
      :birthday,
    )
  end
end

