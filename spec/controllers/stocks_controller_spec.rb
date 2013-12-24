require 'spec_helper'

describe StocksController do
  before(:each) do
    @stock = FactoryGirl.create(:stock)
    @role = FactoryGirl.create(:role_user)
    @seller_role = FactoryGirl.create(:role_seller)

    @user = FactoryGirl.create(:user, role: @role)
    @seller = FactoryGirl.create(:user, role: @seller_role)
    @admin = FactoryGirl.create(:user, role: @admin_role)
    @request.env['HTTP_REFERER'] = 'http://test.host/stocks/'
    @redirected_path = @request.env['HTTP_REFERER']
  end

  describe "Guest" do
    describe "NOT AUTORIZED/NO ROLE/NOT OWNER" do
      it "should redirect on create" do
        post :create, stock: { batch_no: @stock.batch_no, expiry_date: @stock.expiry_date, manufactured_date: @stock.manufactured_date, quantity: @stock.quantity, sku_code: @stock.sku_code, sku_description: @stock.sku_description, unit_of_measure: @stock.unit_of_measure, uuid: @stock.uuid }
        response.should redirect_to @redirected_path
      end
    end
  end
end
