class Model < ApplicationRecord
  belongs_to :manufacturer
  has_many :types, dependent: :destroy
end
