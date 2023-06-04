require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user).optional(true) }

    it { is_expected.to belong_to(:order_detail).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:country) }

    it { is_expected.to validate_presence_of(:city) }

    it { is_expected.to validate_presence_of(:street) }
  end
end
