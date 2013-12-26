# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    country "MyString"
    state "MyString"
    district "MyString"
    street_address "MyText"
    pincode "dasa"
    user_id 1
  end
end
