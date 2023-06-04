require 'rails_helper'

RSpec.describe Cart, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user).optional(true) }

    it { is_expected.to have_many(:cart_products).dependent(:destroy) }

    it { is_expected.to have_many(:products).through(:cart_products).dependent(:destroy)}
  end
end
