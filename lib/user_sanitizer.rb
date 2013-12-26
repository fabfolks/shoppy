class User::ParameterSanitizer < Devise::ParameterSanitizer
    def sign_up
      default_params.permit(user_params)
    end

    def account_update
      default_params.permit(user_params)
    end

    private
    def user_params
      [:email, :password, :password_confirmation, addresses_attributes: [:id, :country, :state, :district, :street_address, :pincode]]
    end
end
