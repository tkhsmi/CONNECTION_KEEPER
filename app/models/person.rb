class Person < ApplicationRecord
  belongs_to :user
  has_many :group_people, dependent: :destroy
  has_many :groups, through: :group_people
end

# == Schema Information
#
# Table name: people
#
#  id           :bigint           not null, primary key
#  address      :string(255)
#  birthday     :date
#  furigana     :string(255)      not null
#  mail         :string(255)
#  name         :string(255)      not null
#  phone_number :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_people_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
