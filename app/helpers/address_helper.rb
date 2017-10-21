module AddressHelper
  def address_field_has_error_class(errors, field)
    'has-error' if address_field_has_error?(errors, field)
  end

  def address_field_has_error?(errors, field)
    errors[field].length > 0
  end
end