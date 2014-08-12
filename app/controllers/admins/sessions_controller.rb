class Admins::SessionsController < Devise::SessionsController
  layout 'admins/login'

   def create
    self.resource = warden.authenticate!(auth_options)
    #set_flash_message(:notice, :signed_in) if is_flashing_format?
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, :location => after_sign_in_path_for(resource)
  end

  def destroy
    redirect_path = after_sign_out_path_for(resource_name)
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    #set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
    yield resource if block_given?

    # We actually need to hardcode this as Rails default responder doesn't
    # support returning empty response on GET request
    respond_to do |format|
      format.all { head :no_content }
      format.any(*navigational_formats) { redirect_to redirect_path }
    end
  end
  private
  def after_sign_in_path_for(resource)
    session[:just_logged_in] = true
    admins_root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    session[:just_logged_out] = true
    new_admin_session_path(:logout => true)
  end
end


