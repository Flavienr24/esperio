# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# puts 'Destroy Database...'

# Company.destroy_all
# User.destroy_all
# Project.destroy_all
# Collaboration.destroy_all

# puts 'Creating Database...'

# company_0 = Company.create(name:"The big company")

# user_0 = User.create(first_name:"John", last_name:"Lascience", country:"France", city:"Paris", function:"Fellow researcher", school:"Harvar University", phone:"+33 1 42 61 65 34", email:"john@john.com", password:"password")

# project_0 = Project.create(name:"Hydrolic model conception", description:"We built Devise to help you quickly develop an application that uses authentication. However, we don't want to be in your way when you need to customize it.")

# # collaboration_0 = Collaboration.create(project_id:"0", user_id:"0", joined:"true")

# puts Company.count
# puts User.count
# puts Project.count
# puts Collaboration.count

require 'faker'

puts 'Clean database...'

Company.destroy_all
User.destroy_all
Project.destroy_all
Collaboration.destroy_all

feelows = Company.new(name: 'foo bar')

puts Company.count

puts 'Creating 10 fake...'
10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'password',
    username: Faker::Internet.username,
  )
  user.save!

  3.times do
    seedpackage = Seedpackage.new(
    name:    Faker::Food.vegetables,
    description: Faker::Lorem.sentence,
    location: Faker::Address.full_address,
    package_price: Faker::Number.between(from: 1, to: 10),
    user: user,
    status: 'Disponible'
    )
    seedpackage.remote_photo_url = "http://res.cloudinary.com/dgpkng6h9/image/upload/v1574951261/courge.jpg"
    seedpackage.save!
  end

end

10.times do
  user = User.new(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 'password',
  )
  user.save!
end

puts 'Finished!'

puts "user created : #{User.count} "
puts "seedpackage created : #{Seedpackage.count} "
