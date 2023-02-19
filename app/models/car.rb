class Car < ApplicationRecord
  belongs_to :type
  belongs_to :user

  has_one_attached:car_image

  def get_car_image(width, height)
    unless car_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
    end
    car_image.variant(resize_to_limit: [width, height]).processed
  end
end
