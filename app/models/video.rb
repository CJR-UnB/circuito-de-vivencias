class Video < ApplicationRecord
    validates_presence_of :url
    validates_presence_of :title
    validates :url, format: {with: /^(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([\w-]{10,})/, :multiline => true}
    def unactivate
      self.update(active: false)
    end
end
