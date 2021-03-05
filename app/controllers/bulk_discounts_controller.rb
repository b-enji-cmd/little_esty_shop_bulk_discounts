class BulkDiscountsController < ApplicationController
  def index
  	@merchant = Merchant.find(params[:merchant_id])
  end

  def show
  	@merchant = Merchant.find(params[:merchant_id])
  	@discount = BulkDiscount.find(params[:id])
  end

  def destroy
  	bulk_discount = BulkDiscount.find_by(merchant_id: params[:merchant_id], id:params[:id])
  	bulk_discount.destroy
  	redirect_to merchant_bulk_discounts_path(params[:merchant_id])
  end

  def edit
  	@merchant = Merchant.find(params[:merchant_id])
  	@discount = BulkDiscount.find(params[:id])
  end

  def new
  	BulkDiscount.new
  end

  def update
  	@merchant = Merchant.find(params[:merchant_id])
  	@discount = BulkDiscount.find(params[:id])
  	if @discount.update(bulk_discount_params)
  		redirect_to merchant_bulk_discount_path(@merchant.id, @discount.id)
  	else
  		flash.now[:notice] = "Error updating discount, please fill in all fields correctly"
  		render :edit
  	end
  end

  def create
  	@merchant = Merchant.find(params[:merchant_id])
  	discount = BulkDiscount.new(bulk_discount_params)
  	if discount.save
  		redirect_to merchant_bulk_discounts_path(@merchant.id)
  	else
  		flash.now[:notice] = "Error creating discount, please fill in all fields correctly"
  		render :new
  	end
  end

  private

  def bulk_discount_params
  	params.permit(:quantity_threshold, :percentage_discount, :merchant_id)
  end
end
