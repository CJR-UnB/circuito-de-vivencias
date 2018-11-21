class Video < ApplicationRecord
    validates_presence_of :url
    validates_presence_of :title
end
