FactoryBot.define do

  sequence(:total) { rand(1.0..100.0)}


  factory :order do
    association :user, factory: :user
    association :product, factory: :product
    total
  end

end
