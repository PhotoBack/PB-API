FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }

    after(:create) do |user, evaluator|
      create_list(:image, 5, user: user)
    end
  end

end
