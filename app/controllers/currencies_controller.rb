class CurrenciesController < ApplicationController
  def show
  end

  def index
  	@currencies = Currency.all
  end

  def update
  end
end
