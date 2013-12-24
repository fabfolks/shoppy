FactoryGirl.define do
  factory :user, class: User do
    sequence(:email)  { Faker::Internet.email         }

    password 'qwerty123'
    password_confirmation { |u| u.password }
  end
end
