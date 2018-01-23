FactoryBot.define do
  sequence(:name) { |n| "product#{n}" }
  sequence(:description) { |n| "This is a complete description for product#{n}" }
  sequence(:image_url) { |n| "product#{n}.jpg" }
  sequence(:category) { |n| "category#{n}" }
  sequence(:price) { rand(1.0..100.0)}


  factory :product do
    name
    description
    image_url
    category
    price
  end

end
