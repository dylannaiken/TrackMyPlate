class Food < ApplicationRecord
  belongs_to :nutrition
  belongs_to :user
  has_many :meal_items
end
