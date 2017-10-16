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
      session[:addresses] = true
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
  end
end