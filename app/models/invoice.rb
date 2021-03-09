class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :customer_id

  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :merchants, through: :items
  has_many :bulk_discounts, through: :merchants

  enum status: [:cancelled, :in_progress, :complete]

  def discount(invoice_item_id)
    invoice_items.joins(:bulk_discounts)
    .where('invoice_items.quantity >= bulk_discounts.quantity_threshold')
    .select('invoice_items.*, (invoice_items.quantity * invoice_items.unit_price * (bulk_discounts.percentage_discount / 100) ) as discount, bulk_discounts.id as discount_id')
    .where(id: invoice_item_id)
    .order('bulk_discounts.percentage_discount desc')
    .limit(1)
  end

  def sum_discount(invoice_item)
    return 0 if discount(invoice_item.id).empty?
    discount(invoice_item.id).first.discount
  end

  def total_revenue
    totals = invoice_items.sum do |invoice_item|
      sum_discount(invoice_item)
    end
    
    invoice_items.sum("unit_price * quantity") - totals
  end
end

