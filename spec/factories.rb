FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar12"
    password_confirmation "foobar12"

    factory :admin do
      role :admin
    end
  end

  factory :asset do
    asset_type "Debit"
    description "Default"
    amount 1000
    user
  end
end