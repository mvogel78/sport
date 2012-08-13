FactoryGirl.define do
  factory :user do
    sequence(:lastname)  { |n| "Person#{n}" }
    sequence(:firstname)  { |n| "Test#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end
  
  factory :group do
    name "Group1"
    user
  end
end
