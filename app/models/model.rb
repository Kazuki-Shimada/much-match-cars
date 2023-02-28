class Model < ApplicationRecord
  belongs_to :manufacturer
  has_many :types, dependent: :destroy
  has_one_attached:model_image
  has_many :model_tags, dependent: :destroy
  has_many :tags, through: :model_tags, dependent: :destroy

  def get_model_image
    unless model_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      model_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    model_image
  end

  def self.looks(word)
    @model = Model.where("name LIKE?","%#{word}%")
  end
end
