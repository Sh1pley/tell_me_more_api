FactoryGirl.define do
  factory :user do
    name            {Faker::Superhero.name}
    email           {"#{Faker::ChuckNorris.fact}@test.com"}
    password_digest {"#{rand(10000..99999)}"}
  end
end