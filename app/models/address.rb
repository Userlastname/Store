class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :order_detail, dependent: :destroy

  validates :country, :city, :street, presence: true
end
