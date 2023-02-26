class Type < ApplicationRecord
  belongs_to :model
  has_many :cars, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached:type_image
end
