require 'open-uri'
require 'nokogiri'
class RegistrationsController < Devise::RegistrationsController

def new
  super
end


protected


  def after_sign_up_path_for(resource)
      user_path(@user) # Or :prefix_to_your_route
  end

end
