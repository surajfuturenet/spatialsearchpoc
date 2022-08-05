require "test_helper"

class ConservationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conservation = conservations(:one)
  end

  test "should get index" do
    get conservations_url
    assert_response :success
  end

  test "should get new" do
    get new_conservation_url
    assert_response :success
  end

  test "should create conservation" do
    assert_difference("Conservation.count") do
      post conservations_url, params: { conservation: { address: @conservation.address, description: @conservation.description, latitude: @conservation.latitude, longitude: @conservation.longitude, name: @conservation.name, partid: @conservation.partid, pointid: @conservation.pointid, polygonid: @conservation.polygonid } }
    end

    assert_redirected_to conservation_url(Conservation.last)
  end

  test "should show conservation" do
    get conservation_url(@conservation)
    assert_response :success
  end

  test "should get edit" do
    get edit_conservation_url(@conservation)
    assert_response :success
  end

  test "should update conservation" do
    patch conservation_url(@conservation), params: { conservation: { address: @conservation.address, description: @conservation.description, latitude: @conservation.latitude, longitude: @conservation.longitude, name: @conservation.name, partid: @conservation.partid, pointid: @conservation.pointid, polygonid: @conservation.polygonid } }
    assert_redirected_to conservation_url(@conservation)
  end

  test "should destroy conservation" do
    assert_difference("Conservation.count", -1) do
      delete conservation_url(@conservation)
    end

    assert_redirected_to conservations_url
  end
end
