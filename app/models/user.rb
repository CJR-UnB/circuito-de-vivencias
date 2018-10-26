class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :surname, presence: true
  validates_presence_of :cpf

  with_options :allow_blank => true do |v|
    v.validates_uniqueness_of :cpf
    validates :cpf, format: { with: /([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})/ }
  end
  def turnIntoAdmin
    self.adminRole = true
    self.userRole = false
    self.supervisorRole = false
  end

  def turnIntoUser
    self.adminRole = false
    self.userRole = true
    self.supervisorRole = false
  end

  def turnIntoSupervisor
    self.adminRole = false
    self.userRole = false
    self.supervisorRole = true
  end
end
