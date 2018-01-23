FactoryBot.define do
  sequence(:rating) { rand(1..5)}
  sequence(:body) { |n| "This is comment with #: #{n}" }

  factory :comment do
    association :user, factory: :user
    body
    rating
    association :product, factory: :product
  end

end
