class WorkshopCategory < ApplicationRecord
  belongs_to :category_id
  belongs_to :workshop_id
end
