require 'rails_helper'

RSpec.describe 'bulk discount index' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount_1 = BulkDiscount.create!(percentage_discount: 15,quantity_threshold: 10,merchant_id: @merchant1.id )

    visit merchant_bulk_discounts_path(@merchant1)
  end

  it "can see all discounts" do
    within("#discount-#{@discount_1.id}") do
      expect(page).to have_content(10)
      expect(page).to have_content(15)
      expect(page).to have_link("Delete")
    end
  end

  it "can delete a discount" do
    within("#discount-#{@discount_1.id}") do
      click_on("Delete")
    end
    expect(current_path).to eq(merchant_bulk_discounts_path(@merchant1))
  end

end