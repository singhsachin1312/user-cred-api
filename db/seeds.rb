# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{first_name: "demo", last_name: "test", email: "demo@gmail.com"},
                     {first_name: "demo1", last_name: "test1", email: "demo1@gmail.com"},
                     {first_name: "demo2", last_name: "test2", email: "demo2@gmail.com"},
                     {first_name: "demo3", last_name: "test3", email: "demo3@gmail.com"}])
