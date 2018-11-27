class Contact < ApplicationRecord

  def unactivate
    self.update(active: false)
  end
end
