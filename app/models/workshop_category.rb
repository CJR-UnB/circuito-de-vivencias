class WorkshopCategory < ApplicationRecord
  belongs_to :category
  belongs_to :workshop
end
