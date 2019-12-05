require 'open-uri'
require 'nokogiri'
class RegistrationsController < Devise::RegistrationsController
  def get_user_information
     # programmer la recuperation de la saisie sur le sign up en JS
    url = "https://www.researchgate.net/profile/#{params[:username]}"
     # url = File.read("/home/deguil/Bureau/toto.html") code pour relier une page en local

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    session[:skills] = []

    html_doc.search('div.nova-l-flex:nth-child(2)').each do |element|
      element.search('a:nth-child(1)').each do |elem|
        unless elem.text.include?("Show more")
          skill = elem.text.strip
          # puts elem.text.strip
          session[:skills] << skill
        end
      end
    end

    #scrapping avatar
    html_doc.search('div.nova-e-avatar > img:nth-child(1)').each do |element|
      avatar = element.values.first
      session[:avatar] = avatar
    end

    #scrapping name
    html_doc.search('div.nova-e-text--spacing-xxs').each do |element|
    name = element.text.strip
    session[:first_name] = name.split.first
    session[:last_name] = name.split.last
  end

  redirect_to new_user_registration_path
end

def new
  super
end


protected


  def after_sign_up_path_for(resource)
      user_path(@user) # Or :prefix_to_your_route
  end

end
