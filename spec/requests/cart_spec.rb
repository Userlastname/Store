require 'rails_helper'

RSpec.describe "Carts", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:product) { FactoryBot.create(:product) }
  let(:cart_product) { FactoryBot.create(:cart_product, cart: user.cart, product: product) }

  it "adds a product to the cart" do
    expect {
      post carts_path, params: { product_id: product.id }
    }.to change(CartProduct, :count).by(1)

    expect(response).to have_http_status(:success)
  end
end
