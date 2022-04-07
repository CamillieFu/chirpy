FactoryBot.define do
  factory :user do
    id { 1 }
    email { "yuna@gmail.com" }
    password { "jerkins20" }
    first_name { "Yuna" }
    last_name { "Jackson" }
  end

  # factory :admin do
  #   id {2}
  #   email {"test@admin.com"}
  #   password {"qwerty"}
  #   admin {true}
  # end
end
