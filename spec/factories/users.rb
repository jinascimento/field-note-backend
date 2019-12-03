FactoryBot.define do
  factory :user do
    email { 'teste@teste.com.br' }
    username { 'teste' }
    password { '123456' }

    transient do
      qtt_annotations { 3 }
    end

    trait :with_annotations do
      after(:create) do |user, evaluator|
        create_list(:annotation, evaluator.qtt_annotations, user_id: user.id)
      end
    end
  end
end