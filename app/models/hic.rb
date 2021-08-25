class Hic < ApplicationRecord
  belongs_to :user
  belongs_to :pict
  has_many :evals
end
