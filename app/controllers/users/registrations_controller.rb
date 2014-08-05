class Users::RegistrationsController < Devise::RegistrationsController

  layout :choose_layout
  expose(:selected_plan) { Plan.find_by_slug(params[:plan]) }

  after_filter :after_registration, :only => [:create]

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
    resource.build_account
    resource.account.cards.build
    resource.agree_newsletter = true
    #resource.account.build_subscription
    #resource.plan_slug = plan.slug if plan
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    resource.is_admin = true
    resource.is_owner = true
    resource.phone = resource.account.phone
    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        add_referal
        resource.post_sign_up
        #set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        message = 'New Account ' + "\n"
        message = message +   ' ON: ' + Rails.env + "\n"
        message = message +   ' Acc Name: ' + resource.account.name + "\n"
        message = message +   ' Owner Name: ' + resource.name + "\n"
        message = message +   ' Phone: ' + resource.phone + "\n"
        alert_managers ({:message => message})
        Resque.enqueue(RegistrationMailerQueue, { :user_id => resource.id  })
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
    users_root_path
  end

  def after_sign_up_fails_path_for(resource)
    new_user_registration_path
  end

  def after_sign_up_path_for(resource)
    session[:just_registered] = true
    sign_in(resource)
    users_root_path
  end

  private
  def sign_up_params
    allow = [:first_name, :last_name, :phone, :email, :password, :password_confirmation, :agree_newsleter, account_attributes: [:name, :phone, :website, :company_size, :sign_up_plan_id, :credit_card_token, :stripe_card_id]]
    params.require(resource_name).permit(allow)
  end




end

