class CheckoutController < ApplicationController
  include Wicked::Wizard
  include CheckoutStepping

  steps :addresses, :shipping, :payment, :confirm, :complete

  def show
    checkout_step
  end

  def update
    checkout_step true
    redirect_to next_wizard_path unless performed?
  end
end
