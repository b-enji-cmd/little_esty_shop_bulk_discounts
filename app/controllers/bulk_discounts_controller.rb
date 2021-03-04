class BulkDiscountsController < ApplicationController
  def index
  	@merchant = Merchant.find(params[:merchant_id])
  end

  def show
  end

  def destroy
  end

  def edit
  end
end
