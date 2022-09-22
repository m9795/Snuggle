FactoryBot.define do
  factory :user do
    name { 'テストユーザー1' }
    email { 'test1@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    status { false }
  end
end
