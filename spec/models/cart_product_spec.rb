require 'rails_helper'

RSpec.describe CartProduct, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:cart) }

    it { is_expected.to belong_to(:product) }
  end
end
