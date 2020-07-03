# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

30.times do |t|

  if t != 0
    Studytime.create!(day: "2020-06-#{t}", start_time: "2020-06-#{t} 10:00:00", end_time: "2020-06-#{t} 12:00:00", admin_user_id: 1)
    Studytime.create!(day: "2020-06-#{t}", start_time: "2020-06-#{t} 14:00:00", end_time: "2020-06-#{t} 16:00:00", admin_user_id: 1)
  end

end

30.times do |t|

  if t != 0
    Studytime.create!(title: "Ruby", day: "2020-06-#{t}", start_time: "2020-06-#{t} 17:00:00", end_time: "2020-06-#{t} 18:30:00", admin_user_id: 1)
    Studytime.create!(title: "rails", day: "2020-06-#{t}", start_time: "2020-06-#{t} 19:00:00", end_time: "2020-06-#{t} 20:15:00", admin_user_id: 1)
  end

end

20.times do |t|

  if t != 0
    Studytime.create!(title: "Docker", day: "2020-06-#{t}", start_time: "2020-06-#{t} 21:40:00", end_time: "2020-06-#{t} 22:30:00", admin_user_id: 1)
    Studytime.create!(title: "JavaScript", day: "2020-06-#{t}", start_time: "2020-06-#{t} 23:00:00", end_time: "2020-06-#{t} 23:55:00", admin_user_id: 1)
  end

end
