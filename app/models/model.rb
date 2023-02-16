class Model < ApplicationRecord
  belongs_to :manufacturer
  has_many :types, dependent: :destroy
  has_one_attached:model_image
  
 def get_model_image
  unless model_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  model_image
end
end
