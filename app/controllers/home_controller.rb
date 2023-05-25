class HomeController < ApplicationController
  def index;end
  def show
    @category = resource
  end
end
