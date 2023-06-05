require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:category) }

    it { is_expected.to have_many(:orders).through(:product_orders).dependent(:destroy) }

    it { is_expected.to have_many(:product_orders).dependent(:destroy) }
  end
end
