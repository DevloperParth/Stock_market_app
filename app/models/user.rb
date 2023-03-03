class User < ApplicationRecord
  has_many :currencies
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
end
