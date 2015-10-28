class CurrencyCode < ActiveRecord::Base
	belongs_to :currency
	belongs_to :country
end
