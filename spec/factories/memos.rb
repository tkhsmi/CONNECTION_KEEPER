FactoryBot.define do
  factory :memo do
    content { 'MyText' }
    association :user
  end
end
