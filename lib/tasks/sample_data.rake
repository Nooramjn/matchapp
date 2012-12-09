namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example Fan",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      Fan.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
