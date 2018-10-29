class Workshop < ApplicationRecord
  has_one :user, foreign_key: 'author_id'
  has_one :user, foreign_key: 'editor_id'
  has_one_attached :document
  has_many :evaluations
  has_many :users, through: :evaluations

  validates :title, presence: true
end
