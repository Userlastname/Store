require 'rails_helper'

RSpec.describe "Orders", type: :request do
  include Devise::Test::IntegrationHelpers

  before do
    user = FactoryBot.create(:user)
    sign_in user
  end

  describe "Post /orders" do
    it "makes an order" do

    end
  end
end
