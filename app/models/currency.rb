class Currency < ActiveRecord::Base
	validates :currency, presence: true
	has_many :currency_codes
	has_many :countries, :through => :currencies_codes
end
