module CheckoutStepping
  extend ActiveSupport::Concern

  included do
    private

    def checkout_step(update = false)
      return render_wizard if step == next_step
      send("#{update ? 'update' : 'show'}_#{step}")
    end

    def show_login
      session[:checkout] = true
      jump_to(next_step) if current_user
      render_wizard
    end

    def show_addresses
      return redirect_to :root if @order.quantity <= 0
      @shipping = @order.shipping_address || ShippingAddress.new
      @billing  = @order.billing_address  || BillingAddress .new
      render_wizard
    end

    def show_shipping
      @deliveries = Delivery.all
      jump_to(previous_step) unless session[:addresses]
      render_wizard
    end

    def show_payment
      @credit_card = @order.credit_card || CreditCard.new
      jump_to(previous_step) unless session[:shipping] && session[:addresses]
      render_wizard
    end

    def show_confirm
      jump_to(previous_step) unless session[:payment] && session[:shipping] && session[:addresses]
      render_wizard
    end

    def show_complete
      jump_to(previous_step) unless session[:confirm] && session[:payment] && session[:shipping] && session[:addresses]
      render_wizard
    end

    def update_login
      # https://github.com/plataformatec/devise/wiki/How-To:-Automatically-generate-password-for-users-(simpler-registration)
      # https://stackoverflow.com/questions/27652534/devise-create-user-using-only-the-email-address
      render_wizard unless current_user
    end

    def update_addresses
      @shipping = @order.shipping_address || ShippingAddress.new(order: @order)
      @billing  = @order.billing_address  || BillingAddress .new(order: @order)
      shipping = @shipping.update(use_billing? ? billing_address_params : shipping_address_params)
      billing  = @billing .update(billing_address_params )
      render_wizard unless shipping && billing
      session[:addresses] = shipping && billing
    end

    def update_shipping
      delivery = @order.update(delivery_params)
      render_wizard unless delivery
      session[:shipping] = delivery
    end

    def update_payment
      @credit_card = @order.credit_card || CreditCard.new(order: @order)
      credit_card = @credit_card.update(credit_card_params)
      render_wizard unless credit_card
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

    def credit_card_params
      params.require(:order)
            .require(:credit_card)
            .permit(:name,
                    :number,
                    :expiration_date,
                    :cvv)
    end

    def use_billing?
      return false unless params[:address]
      params.require(:address)
            .require(:use_billing) == 'true'
    end

    def delivery_params
      params.require(:order).permit(:delivery_id)
    end
  end
end