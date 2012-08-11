FactoryGirl.define do
  factory :user do
    lastname     "Hartl"
    firstname    "Michael"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
