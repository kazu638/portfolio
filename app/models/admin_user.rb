class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :studytimes, dependent: :destroy
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable
end
