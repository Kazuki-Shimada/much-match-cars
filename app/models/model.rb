class Model < ApplicationRecord
  belongs_to :manufacturer
  has_many :types, dependent: :destroy
  has_one_attached:model_image
end
