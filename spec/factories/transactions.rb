FactoryBot.define do
    factory :transaction do
      amount { Faker::Number.decimal(l_digits: 2) }
      association :source_wallet, factory: :wallet
      association :target_wallet, factory: :wallet
    end
  end
  