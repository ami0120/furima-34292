FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    encrypted_password {'123TEST'}
    password_confirmation {encrypted_password}
    nickname {Faker::Internet.username}
    first_name {'山田'}
    last_name {'花子'}
    first_ruby {'ヤマダ'}
    last_ruby {'ハナコ'}
    birthday {Faker::Date.birthday}
  end
end
