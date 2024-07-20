FactoryBot.define do
  factory :group do
    name { 'MyString' }
    association :user
  end
end
