FactoryBot.define do
  factory :orderitem do
    
  end
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@gmail.com" }
    password { "12345678" }
    intro { FFaker::Lorem.paragraph }
  end

end