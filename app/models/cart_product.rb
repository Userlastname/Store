class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def total_price
    self.quantity * self.product.price
  end

  def self.find_or_create_cart_product(cart, product)
    cart_product = cart.cart_products.find_by(product_id: product.id)
    if cart_product.present?
      cart_product
    else
      CartProduct.create(cart: cart, product: product, quantity: 0)
    end
  end
end
