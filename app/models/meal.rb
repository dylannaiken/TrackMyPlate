class Meal < ApplicationRecord
  belongs_to :day
  has_many :meal_items
end
