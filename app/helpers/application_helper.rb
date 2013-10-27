module ApplicationHelper

  def resource_name
    @resource_name || "user"
  end

  def devise_mapping
    @devise_mappng || Devise.mappings[:user]
  end
end
