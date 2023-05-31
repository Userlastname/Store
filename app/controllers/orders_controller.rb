class OrdersController < ApplicationController
  def new
    @order = Order.new
    @order.build_order_detail
    @order.order_detail.build_address
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: "Order was successfully created."
    else
      render :new
    end
  end

  def index
    @user_orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:status, :ordered_at, :user_id,
      order_detail_attributes: [:first_name, :last_name, :email, address_attributes: [:country, :city, :street, :comment]])
  end

end
