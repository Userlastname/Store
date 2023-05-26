class HomeController < ApplicationController
  def index
  @query = Product.ransack(params[:q])
  @products = @query.result(distinct: :true)
  end

  def about_us;end
end
