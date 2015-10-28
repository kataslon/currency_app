module CurrenciesHelper
  
  def get_visited_countries(currency_id)
    currency_code = CurrencyCode.where(currency_id: currency_id)
    id_arr = []
    currency_code.each do |cc|
      id_arr << cc.country_id
    end
    @countries = Country.where(id: id_arr, visited: true)
  end

end
