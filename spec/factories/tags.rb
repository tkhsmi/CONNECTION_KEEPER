FactoryBot.define do
  factory :tag do
    name { 'MyString' }
    association :user
  end
end
