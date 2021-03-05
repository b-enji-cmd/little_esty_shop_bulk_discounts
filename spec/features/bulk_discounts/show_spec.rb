require 'rails_helper'

RSpec.describe 'bulk discount show' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount_1 = BulkDiscount.create!(percentage_discount: 15,quantity_threshold: 10,merchant_id: @merchant1.id )

    visit merchant_dashboard_index_path(@merchant1)
  end

  it "can see the quantity threshold and percantage discount" do
    click_on ("Discounts")
    click_on("#{@discount_1.id}")
    within("#discount-#{@discount_1.id}") do
        expect(page).to have_content(15)
        expect(page).to have_content(10)
    end
  end

end