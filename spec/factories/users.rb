FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password1' }
    password_confirmation { password }
    nickname { Faker::Internet.username }
    first_name { '山田' }
    last_name { '花子' }
    first_ruby { 'ヤマダ' }
    last_ruby { 'ハナコ' }
    birthday { Faker::Date.birthday }
  end
end
