require 'rails_helper'

RSpec.describe 'bulk discount edit' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount_1 = BulkDiscount.create!(percentage_discount: 15,quantity_threshold: 10,merchant_id: @merchant1.id )
    json_response = File.read('spec/fixtures/holidays.json')
   # stub_request(:get,'https://date.nager.at/Api/v2/NextPublicHolidays/us' ).
    #to_return(status: 200, body: json_response)

     stub_request(:get, "https://date.nager.at/Api/v2/NextPublicHolidays/us").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

    visit merchant_bulk_discount_path(@merchant1, @discount_1)
  end

  it "can edit a discount" do
    within("#discount-#{@discount_1.id}") do
      expect(page).to have_link("Edit")

      click_on("Edit")
      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1.id, @discount_1.id))
    end

    visit edit_merchant_bulk_discount_path(@merchant1.id, @discount_1.id)

    fill_in "quantity_threshold", with: 15
    fill_in "percentage_discount", with: 20

    click_on "Update"

    expect(current_path).to eq(merchant_bulk_discount_path(@merchant1.id, @discount_1.id))

  end

  it "cannot enter strings for information" do
    within("#discount-#{@discount_1.id}") do
      expect(page).to have_link("Edit")

      click_on("Edit")
      expect(current_path).to eq(edit_merchant_bulk_discount_path(@merchant1.id, @discount_1.id))
    end

    visit edit_merchant_bulk_discount_path(@merchant1.id, @discount_1.id)

    fill_in "quantity_threshold", with: ""
    fill_in "percentage_discount", with: ""

    click_on "Update"
    expect(page).to have_content("Error updating discount, please fill in all fields correctly")
  end

end
