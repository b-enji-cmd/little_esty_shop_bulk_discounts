class BulkDiscountsController < ApplicationController
  def index
  	@merchant = Merchant.find(params[:merchant_id])
  	binding.pry
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def new
  	BulkDiscount.new
  end

  def create
  	@merchant = Merchant.find(params[:merchant_id])
  	@discount = BulkDiscount.new(bulk_discount_params)
    binding.pry
  	if @discount.save
  		redirect_to merchant_bulk_discount_path(@merchant)
  	else
  		flash[:notice] = 'Error creating discount, please fill in all fields correctly'
  		render :new
  	end
  end

  private

  def bulk_discount_params
  	params.permit(:quantity_threshold, :percentage_discount, :merchant_id)
  end
end
