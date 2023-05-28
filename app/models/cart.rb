class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products, dependent: :destroy
  before_destroy :clear_associations

  def sub_total
    sum = 0
    self.cart_products.each do |item|
      sum+= item.total_price
    end
    sum
  end

  def sub_quantity
    sum = 0
    self.cart_products.each do |item|
      sum += item.quantity
    end
    sum
  end

  private

  def clear_associations
    if user.present? && user.cart == self
      user.cart = nil
      user.save
    end
  end
end
