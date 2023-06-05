require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user).optional(true) }

    it { is_expected.to have_one(:order_detail).dependent(:destroy) }

    it { is_expected.to have_one(:address).through(:order_detail).dependent(:destroy) }

    it { is_expected.to have_many(:product_orders).dependent(:destroy) }

    it { is_expected.to have_many(:products).through(:product_orders).dependent(:destroy) }

    it { is_expected.to accept_nested_attributes_for(:order_detail) }
  end
end
