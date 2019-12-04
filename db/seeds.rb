# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#scrapping
require 'open-uri'
require 'nokogiri'

name = "Martin_Jean"  # programmer la recuperation de la saisie sur le sign up
url = "https://www.researchgate.net/profile/#{name}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

skills = []
skill = 0

html_doc.search('div.nova-l-flex:nth-child(2)').each do |element|
  element.search('a:nth-child(1)').each do |elem|
    unless elem.text.include?("Show more")
      skill = elem.text.strip
      #puts elem.attribute('href').value
      puts elem.text.strip
    end
  skills << skill
end
end



# html_doc.search('div.nova-e-avatar > img:nth-child(1)').each do |element|
#       puts = elem.text.strip
#       puts = elem.attribute('src').value
#     end

