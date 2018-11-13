class Category < ApplicationRecord
  has_many :workshop_categories
  has_many :workshops, through: :workshop_categories
end
