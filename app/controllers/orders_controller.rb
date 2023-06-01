class OrdersController < ApplicationController
  before_action :authenticate_user!
  def new
    @order = Order.new
    @order.build_order_detail
    @order.order_detail.build_address
  end

  def create
    @order = current_user.orders.build(order_params)
    cart_products = current_user.cart.cart_products

    cart_products.each do |cart_product|
      @order.products << cart_product.product
    end

    if @order.save
      session.delete(:cart_id)
      current_user.cart.cart_products.destroy_all
      flash[:success] = "Order was successfully created."
      redirect_to @order
    else
      render :new
    end
  end

  def index
    @user_orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @products = @order.products
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:success] = "Order was successfully canceled."
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order).permit(:status, :ordered_at,
      order_detail_attributes: [:first_name, :last_name, :phone_number, address_attributes: [:country, :city, :street, :comment]])
  end
end
