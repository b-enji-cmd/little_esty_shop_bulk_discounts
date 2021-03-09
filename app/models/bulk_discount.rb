class BulkDiscount < ApplicationRecord
	validates_presence_of :percentage_discount, numericality: true
	validates_presence_of :quantity_threshold, numericality: true
	validates_numericality_of :percentage_discount
	validates_numericality_of :quantity_threshold

  belongs_to :merchant
end
