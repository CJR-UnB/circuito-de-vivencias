class Background < ApplicationRecord
  has_one_attached :image

  validates :image, presence: true, blob: {content_type: ['image/jpeg', 'image/png']}

  def unactivate
    self.update(active: false)
  end
end
