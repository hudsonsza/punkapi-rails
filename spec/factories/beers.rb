FactoryGirl.define do
  factory :beer do
    name { Faker::Lorem.word }
    description { Faker::Lorem.word }
  end
end