require 'spec_helper'

describe Users::RegistrationsController do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  context "create" do
    it "should create addresses along when passed" do
      user_params = FactoryGirl.attributes_for(:user)
      user_params.merge!({"addresses_attributes" => {"0" => FactoryGirl.attributes_for(:address)}})
      old_user_count = User.count
      expect {post :create, user: user_params}.to change(Address, :count).by(1)
      User.count.should == old_user_count + 1
    end

    it "should not create addresses or user when invalid user params passed" do
      user_params = FactoryGirl.attributes_for(:user, password: "abcd", password_confirmation: "sdfer")
      user_params.merge!({"addresses_attributes" => {"0" => FactoryGirl.attributes_for(:address)}})
      old_user_count = User.count
      expect {post :create, user: user_params}.to_not change(Address, :count)
      User.count.should == old_user_count
    end

    it "should not create addresses or user when invalid user params passed" do
      user_params = FactoryGirl.attributes_for(:user)
      user_params.merge!({"addresses_attributes" => {"0" => FactoryGirl.attributes_for(:address, country: "")}})
      old_user_count = User.count
      expect {post :create, user: user_params}.to_not change(Address, :count)
      User.count.should == old_user_count
    end
  end
end
