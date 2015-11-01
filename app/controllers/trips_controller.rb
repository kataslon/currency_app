class TripsController < ApplicationController
  
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
    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Currency was successfully created.' }
        format.json { render :show, status: :created, location: @trip }
      else
        format.html { render :new }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end

  private

    def trip_params
      params.require(:trip).permit(:description, :name)
    end

end
