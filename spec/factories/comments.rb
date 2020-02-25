FactoryBot.define do
  factory :comment do
    comment               {"これはファクトリーボットです。"}
    created_at            {"2020-02-25 15:00:33"}
    updated_at            {"2020-02-25 15:00:33"}
    association :board, factory: :board
    association :user, factory: :user
  end
end
