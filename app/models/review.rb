class Review < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :type, dependent: :destroy
  has_many :goods
end
