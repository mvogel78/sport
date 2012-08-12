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
  end
end
