# frozen_string_literal: true

class Workshop < ApplicationRecord
  has_one :user, foreign_key: 'author_id'
  has_one :user, foreign_key: 'editor_id'
  has_one_attached :document
  has_many :evaluations
  has_one :feedback
  has_many :users, through: :evaluations
  has_many :comments

  validates :title, presence: true
  validates :document, presence: true, blob: {content_type: ['application/vnd.oasis.opendocument.text', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']}

  enum status: {in_hold: 0, accepted: 1, rejected: 2}



  def accept
    self.status = 'accepted'
  end

  def reject
    self.status = 'rejected'
  end

  def put_in_hold
    self.status = 'in_hold'
  end

end
