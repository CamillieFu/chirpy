FactoryBot.define do
  factory :kid do
    sequence(:first_name) { |n| "First Name#{n}" }
    sequence(:last_name) { |n| "Last Name#{n}" }
    age { 15 }
    birthday { "2001-01-01" }
    user_id { 1 }
    dictionary_id { 1 }
  end
end
