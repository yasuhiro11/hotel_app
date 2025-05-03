require "test_helper"

class Admin::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_dashboard_index_url
    assert_response :success
  end

  test "should get users" do
    get admin_dashboard_users_url
    assert_response :success
  end

  test "should get properties" do
    get admin_dashboard_properties_url
    assert_response :success
  end

  test "should get bookings" do
    get admin_dashboard_bookings_url
    assert_response :success
  end
end
