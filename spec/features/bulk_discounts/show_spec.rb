require 'rails_helper'

RSpec.describe 'bulk discount show' do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @discount_1 = BulkDiscount.create!(percentage_discount: 15,quantity_threshold: 10,merchant_id: @merchant1.id )

    json_response = File.read('spec/fixtures/holidays.json')
      stub_request(:get, "https://date.nager.at/Api/v2/NextPublicHolidays/us").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v1.3.0'
           }).
         to_return(status: 200, body: json_response, headers: {})

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

  it "can edit the discount" do
    click_on ("Discounts")
    click_on("#{@discount_1.id}")

    within("#discount-#{@discount_1.id}") do
      expect(page).to have_link("Edit")
      click_on "Edit"
    end

    expect(current_path).to eq edit_merchant_bulk_discount_path(@merchant1, @discount_1)
    fill_in "quantity_threshold", with: 10
    fill_in "percentage_discount", with: 13
    click_on "Update"

    within("#discount-#{@discount_1.id}") do
           expect(page).to have_content(10)
           expect(page).to have_content(13)
    end
  end

end
