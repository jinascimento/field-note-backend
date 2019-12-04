FactoryBot.define do
  factory :annotation do
    description { 'Anotação teste' }
    longitude { '11' }
    latitude { '22' }
    noted_at { DateTime.now }
  end
end