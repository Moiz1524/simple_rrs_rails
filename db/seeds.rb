# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
  cities = City.create([{ name: 'Lahore' }, { name: 'Karachi' }, { name: 'Islamabad' }, { name: 'Peshawar' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#   Mayor.create(name: 'Emanuel', city: cities.first)
  User.create(email: 'user@test.com',password: "admin123")
  Admin.create(email: 'admin@test.com',password: "admin123")