FactoryBot.define do
  factory :user do
    name  { Faker::Lorem.characters(number:20) }
    email { "test@test.com" }
    password  { "123456" }
    encrypted_password { "123456" }
  end
end
