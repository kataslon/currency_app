class UnvisitedCurrenciesController < ApplicationController
  def index
  	@currencies = Currency.where(id: unvisited_id)
  end

  protected

  def unvisited_id
    arr = []
    Country.all.where(visited: false).each do |country|
      arr << country.id
    end
    id_arr = []
    CurrencyCode.all.where(country_id: arr).each do |currency_code|
      id_arr << currency_code.currency_id
    end
    byebug
    return id_arr
  end
end
