FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Title#{n}" }
    sequence(:content) { |n| "Content#{n}" }
    sequence(:author) { |n| "Author#{n}" }
    date { "2000-12-25" }
  end
end
