class Manufacturer < ApplicationRecord
  has_many :models, dependent: :destroy
  
  def self.looks(word)
    @manufacturer =Manufacturer.where("name LIKE?", "%#{word}%")
  end
end
