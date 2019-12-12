class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_time

  protected

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname, :phone, :country, :city, :function, :school, :avatar, :company_id, skill_list: []])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, :phone, :country, :city, :function, :school, :avatar, :company_id, skill_list: []])
  end


  def set_time
    @datetime = Time.now
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

end
