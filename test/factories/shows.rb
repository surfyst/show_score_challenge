FactoryGirl.define do
  factory :show do
    title { Faker::Lorem.words(3).join(' ').titleize}

    after(:create) do |show|
      FactoryGirl.create_list(:review, rand(5..20), :show => show)
    end
  end
end