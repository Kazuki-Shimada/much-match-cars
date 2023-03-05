class Type < ApplicationRecord
  belongs_to :model
  has_many :cars, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached:type_image

  validates :model_id, presence: true
  validates :name, presence: true
  validates :capacity, presence: true
  validates :displacement, presence: true
  validates :fuel_consumption, presence: true
  validates :fuel_consumption, presence: true
  validates :price, presence: true

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
end
