class BulkDiscountsController < ApplicationController
	before_action :parse_json, :find_merchant

	def parse_json
		@holidays = HolidayService.holidays
	end

  def index
  end

  def show
  	@discount = BulkDiscount.find(params[:id])
  end

  def destroy
  	bulk_discount = BulkDiscount.find_by(merchant_id: params[:merchant_id], id:params[:id])
  	bulk_discount.destroy
  	redirect_to merchant_bulk_discounts_path(params[:merchant_id])
  end

  def edit
  	@discount = BulkDiscount.find(params[:id])
  end

  def new
  	BulkDiscount.new
  end

  def update
  	@discount = BulkDiscount.find(params[:id])
  	if @discount.update(bulk_discount_params)
  		redirect_to merchant_bulk_discount_path(@merchant.id, @discount.id)
  	else
  		flash.now[:notice] = "Error updating discount, please fill in all fields correctly"
  		render :edit
  	end
  end

  def create
  	
  	discount = BulkDiscount.new(bulk_discount_params)
  	if discount.save
  		redirect_to merchant_bulk_discounts_path(@merchant.id)
  	else
  		flash.now[:notice] = "Error creating discount, please fill in all fields correctly"
  		render :new
  	end
  end

  private

  def find_merchant
  	@merchant = Merchant.find(params[:merchant_id])
  end

  def bulk_discount_params
  	params.permit(:quantity_threshold, :percentage_discount, :merchant_id)
  end
end
