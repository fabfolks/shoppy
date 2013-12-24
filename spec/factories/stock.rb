FactoryGirl.define do
  factory :stock, class: Stock do
    sequence(:uuid)   {UUID.new.to_s}
    sequence(:sku_code) {Faker::Lorem.word}
    sequence(:batch_no) {Faker::Lorem.word}
    sequence(:manufactured_date) {rand(1.year).ago}
    sequence(:expiry_date) {rand(1.year).ago}
    sequence(:quantity) {rand(10)}
    sequence(:unit_of_measure) {Faker::Lorem.word}
  end
end
