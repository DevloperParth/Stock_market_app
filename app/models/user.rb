class User < ApplicationRecord

  has_many :quantities
  has_many :currencies, through: :quantities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable
  ROLES = %w[admin user]
  
  def admin?
    role == 'admin'
  end
  
  def user?
    role == 'user'
  end
    # after_create :coin_quantity
  # private
   
  # def coin_quantity
  #   current_user.coin_quantity = +1
  # end
end
