class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :daily_log
  has_many :food, dependent: :destroy
end
