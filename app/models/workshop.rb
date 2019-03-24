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
  validates :document, presence: true, blob: {content_type: ['application/vnd.oasis.opendocument.text', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/pdf']}

  enum status: {in_hold: 0, accepted: 1, rejected: 2}

  def accept
    self.status = 'accepted'
    WorkshopMailer.workshop_status_update(self).deliver
  end

  def reject
    self.status = 'rejected'
    WorkshopMailer.workshop_status_update(self).deliver
  end

  def put_in_hold
    self.status = 'in_hold'
  end

  def hide
    self.update(display: false)
  end

  def show
    self.update(display: true)
  end

  def evaluation
    evaluations = Evaluation.where(workshop_id: self.id)
    evaluation_total = 0
    evaluations.each do |evaluation|
      evaluation_total = evaluation_total + evaluation.evaluationContent
    end
    if evaluations.length != 0
      workshop_evaluation = evaluation_total / evaluations.length
    end
    puts("---->" + workshop_evaluation.to_s)
    return workshop_evaluation
  end
end
