class Group < ApplicationRecord
  belongs_to :user
  has_many :group_people, dependent: :destroy
  has_many :persons, through: :group_people
end

# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_groups_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
