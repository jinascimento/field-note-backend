FactoryBot.define do
  factory :annotation do
    description { 'Anotação teste' }
    longitude { '11' }
    latitude { '22' }
    noted_at { DateTime.now }

    trait :with_user do
      after(:create) do |annotation, evaluator|
        user
      end
    end
  end
end