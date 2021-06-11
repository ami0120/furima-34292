FactoryBot.define do
  factory :shopping_address do
    postal_code {'111-1111'}
    prefecture_id {2}
    municipality { '札幌市札幌' }
    address { '札幌1-1' }
    building_name {''}
    phone_number {'09012345678'}
    user_id {1}
    item_id {1}
  end
end
