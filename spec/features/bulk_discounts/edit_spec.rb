require 'rails_helper'

RSpec.describe 'bulk discount edit' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount_1 = BulkDiscount.create!(percentage_discount: 15,quantity_threshold: 10,merchant_id: @merchant1.id )

    visit merchant_bulk_discount_path(@merchant1, @discount_1)
  end

  it "can edit a discount" do
    within("#discount-#{@discount_1.id}") do
      expect(page).to have_link("Edit")

      click_on("Edit")

      expect(current_path).to eq(edit_merchant_bulk_discount(@merchant1, @discount_1))
      
    end
  end

end