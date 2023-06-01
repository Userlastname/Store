class OrderDetail < ApplicationRecord
  belongs_to :order, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address

  validates :first_name, :last_name, :phone_number, presence: true
  validates :phone_number, format: { with: /\A\d{10}\z/, message: "should be 10 digits" }
end
