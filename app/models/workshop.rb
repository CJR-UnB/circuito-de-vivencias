class Workshop < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :user, foreign_key: 'editor_id'
  has_one_attached :document
end
