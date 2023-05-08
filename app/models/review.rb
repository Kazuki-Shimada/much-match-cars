class Review < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :review_image

  validates :title, presence: true
  validates :body, presence: true
  validates :rate, presence: true
  validates :design, presence: true
  validates :driving_performance, presence: true
  validates :cost, presence: true
  validates :size, presence: true
  validates :safety, presence: true

  def gooded_by?(user)
    goods.exists?(user_id: user.id)
  end
  def get_review_image(width, height)
    review_image.variant(resize_to_limit: [width, height]).processed
  end
end
