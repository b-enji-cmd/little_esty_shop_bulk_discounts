require 'rails_helper'

RSpec.describe 'bulk discount index' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount_1 = BulkDiscount.create!(percentage_discount: 15,quantity_threshold: 10,merchant_id: @merchant1.id )

  end

  it "can see the next 3 holidays" do
    json_response = File.read('spec/fixtures/holidays.json')
    stub_request(:get,'https://date.nager.at/Api/v2/NextPublicHolidays/us' ).
    to_return(status: 200, body: json_response)
    visit merchant_bulk_discounts_path(@merchant1)
    within("#holidays") do
      expect(page).to have_content("Memorial Day")
      expect(page).to have_content("Independence Day")
      expect(page).to have_content("Labour Day")
    end
  end

  it "can see all discounts" do
    json_response = File.read('spec/fixtures/holidays.json')
    stub_request(:get,'https://date.nager.at/Api/v2/NextPublicHolidays/us' ).
    to_return(status: 200, body: json_response)
    visit merchant_bulk_discounts_path(@merchant1)
    within("#discount-#{@discount_1.id}") do
      expect(page).to have_content(10)
      expect(page).to have_content(15)
      expect(page).to have_button("Delete")
    end
  end

  it "can delete a discount" do
    json_response = File.read('spec/fixtures/holidays.json')
    stub_request(:get,'https://date.nager.at/Api/v2/NextPublicHolidays/us' ).
    to_return(status: 200, body: json_response)
    visit merchant_bulk_discounts_path(@merchant1)
    within("#discount-#{@discount_1.id}") do
      click_on("Delete")
    end
    expect(current_path).to eq(merchant_bulk_discounts_path(@merchant1))
  end

end
