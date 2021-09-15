class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :nickname, length: {maximum: 17}
    validates :password, format:{with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}, length: {minimum:6, maximum:20}
  end

  has_many :picts
  has_many :hics
  has_many :evals
  has_many :likes, dependent: :destroy
  has_many :liked_picts, through: :likes, source: :pict
  def already_liked?(pict)
    self.likes.exists?(pict_id: pict.id)
  end


end
