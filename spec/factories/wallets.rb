FactoryBot.define do
    factory :wallet do
      balance { Faker::Number.decimal(l_digits: 3, r_digits: 2) }
      association :entity, factory: :user
    end
  end
  