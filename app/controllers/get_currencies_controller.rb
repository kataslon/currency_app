class GetCurrenciesController < ApplicationController
  def get_currencies
	client = Savon.client(wsdl: "http://www.webservicex.net/country.asmx?WSDL")
    response = client.call :get_currencies
    body = response.hash[:envelope][:body][:get_currencies_response][:get_currencies_result]
    doc = Nokogiri::XML(body)
    doc.xpath("//Table").each do |d|
      Currency.create(currency: d.children[5].children.to_s) if Currency.where(currency: d.children[5].children.to_s).blank?
      if d.children[5].children.to_s == ''
      	currency = Currency.new(id: nil)
      else
        currency = Currency.where(currency: d.children[5].children.to_s).last
      end
      Country.create(country: d.children[1].children.to_s)
      country = Country.last
      # currency.id = nil if d.children[5].children.to_s == '' 
      CurrencyCode.create(country_id: country.id, currency_id: currency.id, currency_code: d.children[7].children.to_s)
    end
    redirect_to currencies_path
  end
end
