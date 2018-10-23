class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :surname, presence: true
  validates_presence_of :cpf

  with_options :allow_blank => true do |v|
    v.validates_length_of :cpf, :is => 11
    v.validates_numericality_of :cpf
    v.validates_uniqueness_of :cpf
    validates :cpf, format: { with: /([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})/ }
  end
  def turnIntoAdmin
    this.adminRole = true
    this.userRole = false
    this.supervisorRole = false
  end

  def turnIntoUser
    this.adminRole = false
    this.userRole = true
    this.supervisorRole = false
  end

  def turnIntoSupervisor
    this.adminRole = false
    this.userRole = false
    this.supervisorRole = true
  end
end
