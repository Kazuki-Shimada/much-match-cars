class Model < ApplicationRecord
  belongs_to :manufacturer
  has_many :types, dependent: :destroy
  has_one_attached:model_image
  has_many :model_tags, dependent: :destroy
  has_many :tags, through: :model_tags, dependent: :destroy

  validates :name, presence: true
  validates :manufacturer_id, presence: true

  def get_model_image(width, height)
    unless model_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      model_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    model_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.looks(word)
    @model = Model.where("name LIKE?","%#{word}%")
  end
end
