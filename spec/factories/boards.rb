FactoryBot.define do
  factory :board do
    title          {"テスト"}
    text           {"これはファクトリーボットです。"}
    created_at     { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)}
    updated_at     { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now)}
    association :user, factory: :user
  end
end
