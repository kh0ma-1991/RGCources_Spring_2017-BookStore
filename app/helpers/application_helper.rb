module ApplicationHelper
  def price_in_currency(price)
    number_to_currency(price, unit: '€')
  end
end
