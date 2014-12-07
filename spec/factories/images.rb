FactoryGirl.define do
  factory :image do
    sequence(:path){ |n| "spec/assets/image#{n}.jpg" }
    user
  end

end
