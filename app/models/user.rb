class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :goal, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :daily_logs, dependent: :destroy
  # accepted_nested_attributes_for :goal 
end
