require 'spec_helper'

describe Address do
  context "create" do
    it "should be success with valid params" do
      expect {Address.create(FactoryGirl.attributes_for(:address))}.to change(Address, :count).by(1)
    end

    it "should faild with invalid params" do
      expect {Address.create(FactoryGirl.attributes_for(:address, country: "", state: ""))}.to_not change(Address, :count)
    end
  end
end
