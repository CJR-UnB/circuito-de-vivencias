class History < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true, blob: {content_type: ['image/jpeg', 'image/png']}
end
