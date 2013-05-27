# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:email => 'Joseph.Stephen.Kennedy@gmail.com', 
            :password => 'birdsdontfly', 
            :password_confirmation => 'birdsdontfly',
            :first_name => 'Joe', :last_name => 'Kennedy', :is_admin => true)
User.create(:email => 'Jay.M.Farber@gmail.com', 
            :password => '2227330', :password_confirmation => '2227330',
            :first_name => 'Jay', :last_name => 'Farber', :is_admin => true)
User.create(:email => 'joe.mcloughlin15@gmail.com', 
            :password => 'henryhenryhenry', 
            :password_confirmation => 'henryhenryhenry',
            :first_name => 'Joe', :last_name => 'McLoughlin', :is_admin => true)
