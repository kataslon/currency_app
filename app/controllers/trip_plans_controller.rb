class TripPlansController < ApplicationController
  
  def new
  	@trip_plan = TripPlan.create(trip_id: params[:trip_id])
  	@countries = Country.where(visited: false)
  end

  def edit
  	@trip_plan = TripPlan.find(params[:id])
  	@trip_plan.update(country_id: params[:country_id]) if TripPlan.where(country_id: params[:country_id]).blank?
  	redirect_to trip_path(@trip_plan.trip_id)
  end

  def destroy
  end
end
