class Type < ApplicationRecord
  belongs_to :model
  has_many :cars
  has_many :reviews
  has_one_attached:type_image
end
