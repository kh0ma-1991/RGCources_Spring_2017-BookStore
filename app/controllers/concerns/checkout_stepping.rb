module CheckoutStepping
  extend ActiveSupport::Concern

  included do
    private

    def checkout_step(update = false)
      return render_wizard if step == next_step
      send("#{update ? 'update' : 'show'}_#{step}")
    end

    def show_login
      jump_to(next_step)
      render_wizard
    end

    def show_addresses
      @shipping = @order.shipping_address || ShippingAddress.new
      @billing  = @order.billing_address  || BillingAddress .new
      render_wizard
    end

    def show_shipping
      jump_to(previous_step) unless session[:addresses]
      render_wizard
    end

    def show_payment
      jump_to(previous_step) unless session[:shipping]
      render_wizard
    end

    def show_confirm
      jump_to(previous_step) unless session[:payment]
      render_wizard
    end

    def show_complete
      jump_to(previous_step) unless session[:confirm]
      render_wizard
    end

    def update_addresses
      @shipping = @order.shipping_address || ShippingAddress.new(order: @order)
      @billing  = @order.billing_address  || BillingAddress .new(order: @order)
      shipping = @shipping.update(use_billing? ? billing_address_params : shipping_address_params)
      billing  = @billing .update(billing_address_params )
      return render_wizard unless shipping && billing
      session[:addresses] = shipping && billing
    end

    def update_shipping
      session[:shipping] = true
    end

    def update_payment
      session[:payment] = true
    end

    def update_confirm
      session[:confirm] = true
    end

    def update_complete
      session[:complete] = true
    end

    def shipping_address_params
      address_params(:shipping_address)
    end

    def billing_address_params
      address_params(:billing_address)
    end

    def address_params(type)
      params.require(:order)
            .require(type)
            .permit(:first_name,
                    :last_name,
                    :address,
                    :city,
                    :zip,
                    :country,
                    :phone)
    end

    def use_billing?
      return false unless params[:address]
      params.require(:address)
            .require(:use_billing) == 'true'
    end
  end
end