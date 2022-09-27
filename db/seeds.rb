# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.find_by(email: 'admin@gmail.com')
  u = User.create(name: 'admin', email: 'admin@gmail.com', role: 'admin', password: 'alliswell')
  u.skip_confirmation!
  u.save
end
5.times do |n|
  next if User.find_by(name: "user#{n}")

  user = User.create(name: "user#{n}", email: "user#{n}@gmail.com", role: 'buyer', password: 'alliswell')
  user.skip_confirmation!
  user.save
end
