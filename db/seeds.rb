# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#require 'spec/factories/*.rb'
puts "Create roles: general, seller and admin"
@role = FactoryGirl.create(:role_user)
@seller = FactoryGirl.create(:role_seller)
@admin = FactoryGirl.create(:role_admin)

@password = "!abcd1234"
puts "Creating admin user. email: admin@shoppy.com, password: #{@password}"

FactoryGirl.create(:user, email: "admin@shoppy.com", password: @password, role: @admin)

puts "Creating sellers: seller1@shoppy.com, seller2@shoppy.com, seller3@shoppy.com with password: #{@password}"

@sellers = []
3.times do |i|
  @sellers << FactoryGirl.create(:user, email: "seller#{i + 1}@shoppy.com", password: @password, role: @seller)
end

puts "Creating 3 stocks each for these sellers"

@sellers.each do |seller|
  3.times do |i|
    FactoryGirl.create(:stock, user: seller)
  end
end

puts "Creating guest users: user1@shoppy.com, user2@shoppy.com, user3@shoppy.com with password: #{@password}"

3.times do |i|
  FactoryGirl.create(:user, email: "user#{i + 1}@shoppy.com", password: @password, role: @role)
end

puts "Done seeding"
