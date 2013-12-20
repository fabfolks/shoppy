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

  test "logged in user should create stock" do
    sign_in users(:user1)
    assert_difference('Stock.count') do
      post :create, stock: { batch_no: @stock.batch_no, expiry_date: @stock.expiry_date, manufactured_data: @stock.manufactured_data, quantity: @stock.quantity, sku_code: @stock.sku_code, sku_description: @stock.sku_description, unit_of_measure: @stock.unit_of_measure, uuid: @stock.uuid }
    end

    assert_redirected_to stock_path(assigns(:stock))
  end

  test "non-logged in user cannot create stock" do
    assert_raises(ArgumentError) {post :create, stock: { batch_no: @stock.batch_no, expiry_date: @stock.expiry_date, manufactured_data: @stock.manufactured_data, quantity: @stock.quantity, sku_code: @stock.sku_code, sku_description: @stock.sku_description, unit_of_measure: @stock.unit_of_measure, uuid: @stock.uuid }}
  end

  test "should show stock" do
    get :show, id: @stock
    assert_response :success
  end

  test "logged in user should get edit" do
    sign_in users(:user1)
    get :edit, id: @stock
    assert_response :success
  end

  test "non-logged in user should not get edit" do
    assert_raises(ArgumentError) {get :edit, id: @stock}
  end

  test "logged in user should update stock" do
    sign_in users(:user1)
    patch :update, id: @stock, stock: { batch_no: @stock.batch_no, expiry_date: @stock.expiry_date, manufactured_data: @stock.manufactured_data, quantity: @stock.quantity, sku_code: @stock.sku_code, sku_description: @stock.sku_description, unit_of_measure: @stock.unit_of_measure, uuid: @stock.uuid }
    assert_redirected_to stock_path(assigns(:stock))
  end

  test "non-logged in user should not update stock" do
    assert_raises(ArgumentError) {patch :update, id: @stock, stock: { batch_no: @stock.batch_no, expiry_date: @stock.expiry_date, manufactured_data: @stock.manufactured_data, quantity: @stock.quantity, sku_code: @stock.sku_code, sku_description: @stock.sku_description, unit_of_measure: @stock.unit_of_measure, uuid: @stock.uuid }}
  end

  test "logged in user should destroy stock" do
    sign_in users(:user1)
    assert_difference('Stock.count', -1) do
      delete :destroy, id: @stock
    end

    assert_redirected_to stocks_path
  end

  test "non-logged in user should destroy stock" do
    assert_raises(ArgumentError) {delete :destroy, id: @stock}
  end
end
