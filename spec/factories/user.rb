FactoryGirl.define do
  factory :user do
    name            {Faker::Superhero.name}
    email           {Faker::Internet.email}
    password        {"password"}
  end
end