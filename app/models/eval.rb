class Eval < ApplicationRecord

  with_options presence:true do
    validates :review, length: {maximum:50}
    validates :scene
    validates :kigo
    validates :rhythm
    validates :tech
    validates :original
  end

  belongs_to :user
  belongs_to :hic
  has_one :pict, through: :hic
end
