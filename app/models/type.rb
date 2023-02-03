class Type < ApplicationRecord
  belongs_to :model
  has_many :cars
  has_many :reviews
end
