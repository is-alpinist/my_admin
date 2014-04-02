# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first: "tom" ,last: "doe" , email:"admin1@example.com", password_digest:"foo", admin: 1)
User.create(first: "susie" ,last: "doe" , email:"user1@example.com", password_digest:"foo", admin: 0)