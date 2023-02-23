class Review < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_many :goods, dependent: :destroy
  
  def gooded_by?(user)
    goods.exists?(user_id: user.id)
  end
end
