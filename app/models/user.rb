class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
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
