FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name   }
    username {Faker::Internet.username}
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    encrypted_password { Faker::Internet.password }
    reset_password_token { Faker::Internet.password }
    reset_password_sent_at { Faker::Date.between(from: 2.years.ago, to:Date.today) }
    remember_created_at { Faker::Date.between(from: 2.years.ago, to:Date.today) }
    confirmation_token { Faker::Internet.password }
    confirmation_sent_at { Faker::Date.between(from: 2.years.ago, to:Date.today) }
    unconfirmed_email { Faker:: Internet.email }
    failed_attempts { Faker::Number.number(digits: 1) }
    unlock_token { Faker::Internet.password }
  end
end
