require 'spec_helper'

describe "User" do
  context "when determining ownership" do
    before do
      @seller = FactoryGirl.create(:role_seller)
      @user1 = FactoryGirl.create(:user, role: @seller)
      @user2 = FactoryGirl.create(:user, role: @seller)
      @stock1  = FactoryGirl.create(:stock, user: @user1)
      @stock2  = FactoryGirl.create(:stock, user: @user2)
    end

    it "should return false when not owner" do
     @user1.owner?(@stock2).should eq(false) 
    end

    it "should return false when owner" do
      @user2.owner?(@stock2).should eq(true) 
    end
  end
end
