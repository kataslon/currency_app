class Trip < ActiveRecord::Base
	has_many :trip_plans
	has_many :countries, :through => :trip_plans
end
