require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:order).dependent(:destroy) }

    it { is_expected.to have_one(:address).dependent(:destroy) }

    it { is_expected.to accept_nested_attributes_for(:address) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }

    it { is_expected.to validate_presence_of(:last_name) }

    it { is_expected.to validate_presence_of(:phone_number) }

    it { is_expected.to allow_value("1234567890").for(:phone_number) }

    it { is_expected.not_to allow_value("123456789").for(:phone_number).with_message("should be 10 digits") }

    it { is_expected.not_to allow_value("12345678901").for(:phone_number).with_message("should be 10 digits") }

    it { is_expected.not_to allow_value("123f567890").for(:phone_number).with_message("should be 10 digits") }
  end
end
