require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associations" do
    it { is_expected.to have_one(:cart).dependent(:destroy) }

    it { is_expected.to have_many(:orders).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to validate_presence_of(:phone_number) }

    it { is_expected.to validate_presence_of(:first_name) }

    it { is_expected.to validate_presence_of(:last_name) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

    it { is_expected.to validate_uniqueness_of(:phone_number) }

    it { is_expected.to allow_value("user@example.com").for(:email) }

    it { is_expected.not_to allow_value("invalid_mail").for(:email) }

    it { is_expected.to allow_value("1234567890").for(:phone_number) }

    it { is_expected.not_to allow_value("o234567890").for(:phone_number).with_message("should be 10 digits") }
  end
end
