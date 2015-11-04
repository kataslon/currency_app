class CountriesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_country, only: [:edit, :update]

  def index
  	get_countries(params[:currency_id])
  end

  def edit
  	@country
  end

  def update
    @country.update(country_params)
    currency_id = @country.currency_codes.first.currency_id
    @countries = get_countries(currency_id)
    redirect_to countries_path(currency_id: currency_id)
  end

  protected

  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params.require(:country).permit(:visited)
  end

  def get_countries(currency_id)
    currency_code = CurrencyCode.where(currency_id: currency_id)
    id_arr = []
    currency_code.each do |cc|
      id_arr << cc.country_id
    end
    @countries = Country.where(id: id_arr)
  end
end
