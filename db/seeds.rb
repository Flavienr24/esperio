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
#url = "https://www.researchgate.net/profile/#{name}
url = File.read("/home/deguil/Bureau/toto.html")

# html_file = open(url).read
html_doc = Nokogiri::HTML(url)

skills = []

html_doc.search('div.nova-l-flex:nth-child(2)').each do |element|
  element.search('a:nth-child(1)').each do |elem|
    unless elem.text.include?("Show more")
      skill = elem.text.strip
      #puts elem.attribute('href').value
      puts elem.text.strip
    skills << skill
  end
end

puts "---------------------------------------------------------------------------"
#scrapping avatar
html_doc.search('div.nova-e-avatar > img:nth-child(1)').each do |element|
  avatar = element.values.first
   puts avatar
  end

puts "---------------------------------------------------------------------------"

# scrapping name
html_doc.search('div.nova-e-text--spacing-xxs').each do |element|
  name = element.text.strip
  puts name
  end
end



puts 'Destroy Database...'

Company.destroy_all
User.destroy_all
Project.destroy_all
Collaboration.destroy_all

puts 'Creating Database...'

company_test = Company.create(name:"The big company")

user_test = User.create(first_name:"John", last_name:"Lascience", country:"France", city:"Paris", function:"Fellow researcher", school:"Harvar University", phone:"+33 1 42 61 65 34", email:"john@john.com", password:"password", company_id: company_test.id)

project_test = Project.create(name:"Hydrolic model conception", description:"We built Devise to help you quickly develop an application that uses authentication. However, we don't want to be in your way when you need to customize it.", user_id: user_test.id, status: 'In Progress', visibility: true, open_to_apply: false)

collaboration_test = Collaboration.create(project_id: project_test.id, user_id: user_test.id, joined: 'Pending')

puts Company.count
puts User.count
puts Project.count
puts Collaboration.count

# require 'faker'

# puts 'Clean database...'

# Company.destroy_all
# User.destroy_all
# Project.destroy_all
# Collaboration.destroy_all

# feelows = Company.new(name: 'foo bar')

# puts Company.count

# puts 'Creating 10 fake user...'

# 10.times do
#   user = User.new(
#     email: Faker::Internet.email,
#     password: 'password',
#     username: Faker::Internet.username,
#   )
#   user.save!

#   2.times do
#     project = Project.new(
#     name:    Faker::Food.vegetables,
#     description: Faker::Lorem.sentence,
#     location: Faker::Address.full_address,
#     user: user,
#     status: 'Disponible'
#     )
#     project.remote_photo_url = "http://res.cloudinary.com/dgpkng6h9/image/upload/v1574951261/courge.jpg"
#     project.save!
#   end

# end

# puts 'Finished!'

# puts "company created : #{Company.count} "
# puts "user created : #{User.count} "
