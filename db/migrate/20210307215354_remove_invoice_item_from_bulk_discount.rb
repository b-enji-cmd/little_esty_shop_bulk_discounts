class RemoveInvoiceItemFromBulkDiscount < ActiveRecord::Migration[5.2]
  def change
  	remove_column :bulk_discounts, :invoice_item_id
  end
end
