class Like < ApplicationRecord
  belongs_to :pict
  belongs_to :user
  validates_uniqueness_of :pict_id, scope: :user_id
end
