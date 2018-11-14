class Feedback < ApplicationRecord
    belongs_to :supervisor, class_name: 'User'
    belongs_to :workshop
end
