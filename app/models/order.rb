class Order < ApplicationRecord
  belongs_to :user, optional: :true
  has_one :order_detail, dependent: :destroy
  has_and_belongs_to_many :products
end
