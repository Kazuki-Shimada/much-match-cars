class Tag < ApplicationRecord
  has_many :model_tags, dependent: :destroy
  has_many :models, through: :model_tags, dependent: :destroy
end
