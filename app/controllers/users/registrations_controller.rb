class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    self.resource.addresses.build
    respond_with self.resource
  end
end
