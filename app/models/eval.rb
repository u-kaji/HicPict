class Eval < ApplicationRecord
  belongs_to :user
  belongs_to :hic
  has_one :pict, through: :hic
end
