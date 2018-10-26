class Workshop < ApplicationRecord
  has_one :user, foreign_key: 'author_id'
  has_one :user, foreign_key: 'editor_id'
  has_many_attached :documents

  validates :title, presence: true
  validates :document, attached: true
end
