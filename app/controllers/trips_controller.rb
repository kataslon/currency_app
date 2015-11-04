class TripsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @countries = @trip.countries
  end

  def new
    @trip = Trip.new
    @countries = Country.where(visited: false)
  end

  def edit
    @trip = Trip.find(params[:id])
    @countries = @trip.countries
    @select_countries = Country.where(visited: false)
  end

  def create
    @trip = Trip.create(trip_params)
    redirect_to trips_path
  end

  def update
    @trip = Trip.find(params[:id])
    @trip.update(trip_params)
    redirect_to edit_trip_path(@trip)
  end

  def destroy
    @trip = Trip.find(params[:id])
    @trip.destroy
    redirect_to trips_path
  end

  private

    def trip_params
      params.require(:trip).permit(:description, :name)
    end

end
