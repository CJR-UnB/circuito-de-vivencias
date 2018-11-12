class Feedback < ApplicationRecord
    belongs_to :supervisor, class_name: 'User'
    belongs_to :workshop_author, class_name: 'User'
end
