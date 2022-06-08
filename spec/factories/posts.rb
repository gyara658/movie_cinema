FactoryBot.define do
  factory :post do
    body { "テストコメント" }
    id { 2 }
    review { 2 }
    image { "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg" }
    poster_path { "/mbRNv2nU1KvdvNif3YzsRO2MJkw.jpg" }
    association :user
  end
end
