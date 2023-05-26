class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  scope :ordered, -> { order(name: :desc) }
end
