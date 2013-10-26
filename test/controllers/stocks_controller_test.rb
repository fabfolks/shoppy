require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  setup do
    @stock = stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stock" do
    assert_difference('Stock.count') do
      post :create, stock: { batch_no: @stock.batch_no, expiry_date: @stock.expiry_date, manufactured_data: @stock.manufactured_data, quantity: @stock.quantity, sku_code: @stock.sku_code, sku_description: @stock.sku_description, unit_of_measure: @stock.unit_of_measure, uuid: @stock.uuid }
    end

    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should show stock" do
    get :show, id: @stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stock
    assert_response :success
  end

  test "should update stock" do
    patch :update, id: @stock, stock: { batch_no: @stock.batch_no, expiry_date: @stock.expiry_date, manufactured_data: @stock.manufactured_data, quantity: @stock.quantity, sku_code: @stock.sku_code, sku_description: @stock.sku_description, unit_of_measure: @stock.unit_of_measure, uuid: @stock.uuid }
    assert_redirected_to stock_path(assigns(:stock))
  end

  test "should destroy stock" do
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock
    end

    assert_redirected_to stocks_path
  end
end
