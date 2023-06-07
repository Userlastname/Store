require 'rails_helper'

RSpec.describe "Orders", type: :request do
  include Devise::Test::IntegrationHelpers

  describe "POST /orders" do
    let!(:user) { FactoryBot.create(:user) }

    before do
      sign_in user
      FactoryBot.create(:cart, user: user)
    end

    it "creates an order" do
      category = FactoryBot.create(:category)
      product = FactoryBot.create(:product, category: category)
      cart_product = FactoryBot.create(:cart_product, cart: user.cart, product: product)

      order_params = {
        order: {
          status: "pending",
          ordered_at: Time.now,
          order_detail_attributes: {
            first_name: "John",
            last_name: "Doe",
            phone_number: "1234567890",
            address_attributes: {
              country: "USA",
              city: "New York",
              street: "123 Main St",
              comment: "Some comment"
            }
          }
        }
      }

      post orders_path, params: order_params

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to(assigns(:order))
      expect(Order.count).to eq(1)
      expect(user.orders.count).to eq(1)
      expect(user.cart.cart_products.count).to eq(0)
      expect(session[:cart_id]).to be_nil
      expect(flash[:success]).to eq("Order was successfully created.")
    end
  end
end
