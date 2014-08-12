class Admins::PasswordsController < Devise::PasswordsController
  layout 'admins/login'

  def update
    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      #flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
      #set_flash_message(:notice, flash_message) if is_flashing_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => admins_root_path
    else
      respond_with resource
    end
  end
end

