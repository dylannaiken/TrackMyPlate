class Food < ApplicationRecord
  belongs_to :meal
  has_one :nutrition, dependent: :destroy
end
