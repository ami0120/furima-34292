FactoryBot.define do
  factory :shopping_address do
    token {'111111'}
    postal_code {'111-1111'}
    prefecture_id {2}
    municipality { '札幌市札幌' }
    address { '札幌1-1' }
    building_name {'札幌ビル'}
    phone_number {'09012345678'}
  end
end
