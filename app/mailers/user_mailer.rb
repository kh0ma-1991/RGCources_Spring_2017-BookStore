class UserMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def fast_sign_up(record, password, opts={})
    @password = password
    devise_mail(record, :fast_sign_up, opts)
  end
end