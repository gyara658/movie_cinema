FactoryBot.define do
  factory :user do
    trait :a do
      username { "username" }
      id { 1 }
      email { "email@1.com" }
      password { "password1" }
      password_confirmation { "password1" }
    end

    trait :b do
      username { "username1" }
      id { 2 }
      email { "" }
      password { "password1" }
      password_confirmation { "password1" }
    end
  end
end
