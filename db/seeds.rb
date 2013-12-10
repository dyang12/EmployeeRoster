# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
managers = Employee.create!([{ :name =>"John Doe", :email => "john_doe@gmail.com",
  :phone_number => "123-456-7890", :admin => "true" }, { :name =>"Jane Lee",
  :email => "jane_lee@gmail.com", :phone_number => "222-222-2222", :admin => "true" },
  { :name =>"Mike Jones", :email => "mike_jones@gmail.com", :phone_number => "333-555-7799",
  :admin => "true" }])