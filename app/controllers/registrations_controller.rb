require 'open-uri'
require 'nokogiri'

class RegistrationsController < Devise::RegistrationsController

def new
  super
end


  protected

  def after_sign_up_path_for(resource)
    @user.update(avatar: session[:avatar])
    @user.skill_list.add(session[:skills])
    @user.save
    user_path(@user) # Or :prefix_to_your_route
  end

  def after_update_path_for(resource)
    user_path(@user) # Or :prefix_to_your_route
  end
end
