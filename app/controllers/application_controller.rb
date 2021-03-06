class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include ApplicationHelper
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
  expose(:email_campaings){ EmailCampaing.is_active}
  expose(:promotions){ Promotion.is_active.order( 'RANDOM() '). limit(4)}
  protect_from_forgery with: :exception
end
