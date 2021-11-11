class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #Establecer valor de rol por defecto
  after_initialize do
    if self.new_record?
      self.role ||= :standard
    end
  end

  devise :database_authenticatable, :registerable,
         #:recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
  enum role: [:standard, :organizer, :admin, :buyer]
  
end
