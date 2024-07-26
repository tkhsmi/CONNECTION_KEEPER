class Memo < ApplicationRecord
  belongs_to :user
  has_many :memo_tags, dependent: :destroy
  has_many :tags, through: :memo_tags

  validates :content, presence: true
end

# == Schema Information
#
# Table name: memos
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_memos_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
