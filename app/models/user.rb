class User < ApplicationRecord

  has_many :quantities
  has_many :currencies, through: :quantities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :confirmable
  enum role: {
    admin: "admin",
    user: "user"
  }
  
end
