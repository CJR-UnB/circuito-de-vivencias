# frozen_string_literal: true

class Evaluation < ApplicationRecord
  belongs_to :user
  belongs_to :workshop
end
