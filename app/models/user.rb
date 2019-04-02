# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_mail
  enum state: {AC: 0, AL: 1, AP: 2, AM: 3, BA: 4, CE: 5, DF: 6, ES: 7, GO: 8,
    MA: 9, MT: 10, MS: 11, MG: 12, PA: 13, PB: 14, PR: 15, PE: 16, PI: 17, RJ: 18,
    RN: 19, RS: 20, RO: 21, RR: 22, SC: 23, SP: 24, SE: 25, TO: 26}

  enum institution_type: {pública: 0, privada: 1}
  has_many :evaluations
  has_many :workshops, through: :evaluations
  has_many :feedbacks
  has_many :comments

  validates :name, presence: true
  validates :state, presence: true
  validates :profession, presence: true
  validates :institution_type, presence: true
  validates :institution, presence: true
  validates :surname, presence: true
  validates_presence_of :cpf
  validates_cpf :cpf

  with_options allow_blank: true do |v|
    v.validates_uniqueness_of :cpf
    validates :cpf, format: { with: /([0-9]{2}[\.]?[0-9]{3}[\.]?[0-9]{3}[\/]?[0-9]{4}[-]?[0-9]{2})|([0-9]{3}[\.]?[0-9]{3}[\.]?[0-9]{3}[-]?[0-9]{2})/ }
  end

  def turnIntoAdmin
    self.role_id = Role.find_by(name: 'Admin').id
  end

  def turnIntoUser
    self.role_id = Role.find_by(name: 'User').id
  end

  def turnIntoSupervisor
    self.role_id = Role.find_by(name: 'Supervisor').id
  end

  def isAdmin?
    self.role_id == Role.find_by(name: 'Admin').id
  end

  def isSupervisor?
    self.role_id == Role.find_by(name: 'Supervisor').id
  end

  def isUser?
    self.role_id == Role.find_by(name: 'User').id
  end

  def send_mail
    UserMailer.user_info(self).deliver
  end
end
