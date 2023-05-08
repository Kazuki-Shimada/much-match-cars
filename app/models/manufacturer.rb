class Manufacturer < ApplicationRecord
  has_many :models, dependent: :destroy

  validates :name, presence: true

  def self.looks(word)
    @manufacturer = Manufacturer.where("name LIKE?", "%#{word}%")
  end
end
