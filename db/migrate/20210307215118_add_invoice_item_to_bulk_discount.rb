class AddInvoiceItemToBulkDiscount < ActiveRecord::Migration[5.2]
  def change
    add_reference :bulk_discounts, :invoice_item, foreign_key: true
  end
end
