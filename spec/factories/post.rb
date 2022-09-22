FactoryBot.define do
  factory :post do
    title { 'タイトル' }
    content { '本文' }
    user_id { 1 }
  end
end
