class MemoTag < ApplicationRecord
  belongs_to :user
  belongs_to :memo
  belongs_to :tag
end

# == Schema Information
#
# Table name: memo_tags
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  memo_id    :bigint           not null
#  tag_id     :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_memo_tags_on_memo_id  (memo_id)
#  index_memo_tags_on_tag_id   (tag_id)
#  index_memo_tags_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (memo_id => memos.id)
#  fk_rails_...  (tag_id => tags.id)
#  fk_rails_...  (user_id => users.id)
#
