class CartsController < ApplicationController
  before_action :initialize_cart

  def show
    @cart = @current_cart
  end

  def create
    item = Product.find(params[:product_id])
    if @current_cart.products.include?(item)
      @cart_product = @current_cart.cart_products.find_by(:product_id => item)
      @cart_product.quantity += 1
    else
      @cart_product = CartProduct.new(cart: @current_cart, product: item, quantity: 1)
    end
    @cart_product.save
  end

  def destroy
    @cart_product = CartProduct.find(params[:id])
    @cart_product.destroy
    redirect_to cart_path
  end

  def add_quantity
    @cart_product = CartProduct.find(params[:id])
    @cart_product.quantity += 1
    @cart_product.save
    redirect_to cart_path
  end

  def reduce_quantity
    @cart_product = CartProduct.find(params[:id])

    if @cart_product.quantity > 1
      @cart_product.quantity -= 1
      @cart_product.save
    else
      @cart_product.destroy
    end

    redirect_to cart_path
  end

  def initialize_cart
    if user_signed_in?
      if session[:cart_id].present?
        @current_cart = Cart.find_by(id: session[:cart_id])
        if @current_cart.present?
          @current_cart.update(user: current_user)
          session[:cart_id] = @current_cart.id
        else
          @current_cart = create_new_cart
        end
      elsif current_user.cart.present?
        @current_cart = current_user.cart
      else
        @current_cart = create_new_cart
      end
    else
      if session[:cart_id].present?
        @current_cart = Cart.find_by(id: session[:cart_id])
        session[:cart_id] = @current_cart.id if @current_cart.present?
      else
        @current_cart = create_new_cart
      end
    end
  end

  def create_new_cart
    cart = Cart.create(user: (current_user if user_signed_in?))
    session[:cart_id] = cart.id
    cart
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:cart_id,:product_id,:quantity)
  end
end
