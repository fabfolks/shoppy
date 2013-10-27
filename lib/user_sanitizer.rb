class User::ParameterSanitizer < Devise::ParameterSanitizer
    def sign_up
      default_params.permit(:email, :password, :role)
    end
end
