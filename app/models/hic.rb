class Hic < ApplicationRecord

  with_options presence: true do
    validates :hic, length: {maximum: 30}
    validates :kigo, length: {maximum: 17}
  end

  belongs_to :user
  belongs_to :pict
  has_many :evals
end
