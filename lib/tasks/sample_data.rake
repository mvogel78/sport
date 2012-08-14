namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(lastname: "Admin",
                 firstname: "User",
                 email: "admin@admin.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)

    35.times do |n|
      lastname  = Faker::Name.last_name
      firstname  = Faker::Name.first_name
      email  = Faker::Internet.email
      password  = "password"
      User.create!(lastname: lastname,
                   firstname: firstname,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end 

    users = User.all(limit: 10)
    20.times do 
       name = Faker::Lorem.words(num = 2)
       agegroup = rand(1..5)
       intermittency = rand(1..4)
       users.each { |user| user.groups.create!(name: name, agegroup: agegroup, intermittency: intermittency) }
  
    end		  


    35.times do |n|
      lastname  = Faker::Name.last_name
      firstname  = Faker::Name.first_name
      password  = "password"
      Child.create!(lastname: lastname,
                   firstname: firstname,
                   born_at: rand(2..15).years.ago.to_date,
                   female: [true,false].sample)
    end 
  end
end 
