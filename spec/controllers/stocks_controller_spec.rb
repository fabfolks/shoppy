require 'spec_helper'

describe StocksController do
  before(:each) do
    @role = FactoryGirl.create(:role_user)
    @seller_role = FactoryGirl.create(:role_seller)

    @user = FactoryGirl.create(:user, role: @role)
    @seller = FactoryGirl.create(:user, role: @seller_role)
    @admin = FactoryGirl.create(:user, role: @admin_role)
    @request.env['HTTP_REFERER'] = 'http://test.host/stocks/'
    @redirected_path = @request.env['HTTP_REFERER']
  end

  shared_examples_for Stock do
    it "should not be able to create" do
      expect {post :create, stock: FactoryGirl.attributes_for(:stock)}.to_not change(Stock, :count)
      response.should redirect_to @redirected_path
    end

    it "should not be able to update" do
      patch :update, id: @stock, stock: FactoryGirl.attributes_for(:stock, batch_no: "1234")
      @stock.reload
      @stock.batch_no.should_not eq("1234")
      response.should redirect_to @redirected_path
    end

    it "should not be able to delete" do
      expect {delete :destroy, id: @stock}.to_not change(Stock, :count)
      response.should redirect_to @redirected_path
    end

    it "should not be able to edit" do
      get :edit, id: @stock
      response.should redirect_to @redirected_path
    end

    it "should be able to list" do
      get :index
      assigns(:stocks).should eq([@stock])
    end

    it "should be able to get" do
      get :show, id: @stock
      response.should be_success
    end
  end

  describe "A guest user" do
    before do
      @stock = FactoryGirl.create(:stock, user: @user)
    end
    context "when not logged in" do
      it_behaves_like Stock
    end

    context "when logged in" do
      before do
        sign_in @user
      end
      it_behaves_like Stock
    end
  end

  describe "A seller" do
    context "when logged in" do
      before do
        @stock = FactoryGirl.create(:stock, user: @seller)
        sign_in @seller
      end

      it "should be able to list" do
        get :index
        assigns(:stocks).should eq([@stock])
      end

      it "should be able to create" do
        expect {post :create, stock: FactoryGirl.attributes_for(:stock)}.to change(Stock, :count).by(1)
        response.should redirect_to Stock.last 
      end

      it "should be able to update" do
        patch :update, id: @stock, stock: FactoryGirl.attributes_for(:stock, batch_no: "1234")
        @stock.reload
        @stock.batch_no.should eq("1234")
        response.should redirect_to stock_path(@stock)
      end

      it "should be able to delete" do
        expect {delete :destroy, id: @stock}.to change(Stock, :count).by(-1)
        response.should redirect_to stocks_path
      end

      it "should be able to edit" do
        get :edit, id: @stock
        response.should be_success
      end

      it "should be able to get" do
        get :show, id: @stock
        response.should be_success
      end
    end

    context "should not be able to access resources of another seller" do
      before do
        @sellerA = FactoryGirl.create(:user, role: @role_seller)
        @sellerB = FactoryGirl.create(:user, role: @role_seller)
        @stock_of_sellerB = FactoryGirl.create(:stock, user: @sellerB)
        sign_in @sellerA
      end

      it "should not be a able to edit stock of another seller" do
        get :edit, id: @stock_of_sellerB
        response.should redirect_to @redirected_path
      end

      it "should not be able to update stock of another seller" do
        patch :update, id: @stock_of_sellerB, stock: FactoryGirl.attributes_for(:stock, batch_no: "1234")
        @stock_of_sellerB.reload
        @stock_of_sellerB.batch_no.should_not eq("1234")
        response.should redirect_to @redirected_path
      end

      it "should not be able to delete stock of another seller" do
        expect {delete :destroy, id: @stock_of_sellerB}.to_not change(Stock, :count)
        response.should redirect_to @redirected_path
      end
    end
  end
end
