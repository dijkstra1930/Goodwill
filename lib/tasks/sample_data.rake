namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      username  = Faker::Name.name
      email = "example-#{n+1}@goodwill.com"
      password  = "deadbeef"
      User.create!(username: username,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do |n|
      product_description = Faker::Lorem.sentence(5)
      users.each { |user| user.products.create!(product_name: "product-#{n+1}", product_price: n,
                                                product_description: product_description) }
    end

  end
end