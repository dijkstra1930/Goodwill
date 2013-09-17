FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "deadbeaf"
    password_confirmation "deadbeaf"

  end

  factory :product do
    sequence(:product_name)  { |n| "Product #{n}" }
    product_price 13.00
    product_description "Lorem ipsum"
    user
  end
end