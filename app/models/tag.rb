class Tag < ApplicationRecord
  has_many :type_tags, dependent: :destroy
  has_many :types, through: :type_tags, dependent: :destroy
end
