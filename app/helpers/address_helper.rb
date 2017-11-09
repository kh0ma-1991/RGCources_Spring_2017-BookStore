module AddressHelper
  def field_has_error_class(errors, field)
    'has-error' if field_has_error?(errors, field)
  end

  def field_has_error?(errors, field)
    errors[field].length > 0
  end
end