FactoryBot.define do
  factory :item do
    name {Faker::Food.fruits}
    text {Faker::Lorem.sentence}
    category_id { 3 }
    condition_id { 3 }
    delivery_charge_id { 3 }
    prefecture_id { 3 }
    days_to_ship_id { 3 }
    price { 1000 }
    association :user

    after(:build) do |image|
      image.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
