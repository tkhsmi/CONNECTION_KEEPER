class GroupPerson < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :people
end

# == Schema Information
#
# Table name: group_people
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint           not null
#  people_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_group_people_on_group_id   (group_id)
#  index_group_people_on_people_id  (people_id)
#  index_group_people_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#  fk_rails_...  (people_id => people.id)
#  fk_rails_...  (user_id => users.id)
#
