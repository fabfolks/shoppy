class Address < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :country, :state, :street_address, :district, :pincode
end
