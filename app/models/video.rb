class Video < ApplicationRecord
    validates_presence_of :url
    validates_presence_of :title

    def unactivate
      self.update(active: false)
    end
end
