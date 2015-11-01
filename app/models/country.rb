class Country < ActiveRecord::Base
	has_many :currency_codes
	has_many :currencies, :through => :currency_codes
	has_many :trip_plans
end
