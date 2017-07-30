require 'test_helper'

class ForecastsControllerTest < ActionController::TestCase
  setup do
    @forecast = forecasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forecasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forecast" do
    assert_difference('Forecast.count') do
      post :create, forecast: { lat: @forecast.lat, lng: @forecast.lng , city: @forecast.city}
    end

    assert_redirected_to forecast_path(assigns(:forecast))
  end

   test "should not save forecast without city" do
  @forecast = Forecast.new
  assert_not @forecast.save , "Forcast cant be made without city"
end

  test "should get edit" do
    get :edit, id: @forecast
    assert_response :success
  end

 

  test "should destroy forecast" do
    assert_difference('Forecast.count', -1) do
      delete :destroy, id: @forecast
    end

    assert_redirected_to forecasts_path
  end
end
