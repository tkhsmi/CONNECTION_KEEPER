FactoryBot.define do
  factory :group_person do
    association :group
    association :people
    association :user
  end
end
