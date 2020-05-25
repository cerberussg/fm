require 'test_helper'

class FederationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @federation = federations(:one)
  end

  test "should get index" do
    get federations_url
    assert_response :success
  end

  test "should get new" do
    get new_federation_url
    assert_response :success
  end

  test "should create federation" do
    assert_difference('Federation.count') do
      post federations_url, params: { federation: { description: @federation.description, name: @federation.name } }
    end

    assert_redirected_to federation_url(Federation.last)
  end

  test "should show federation" do
    get federation_url(@federation)
    assert_response :success
  end

  test "should get edit" do
    get edit_federation_url(@federation)
    assert_response :success
  end

  test "should update federation" do
    patch federation_url(@federation), params: { federation: { description: @federation.description, name: @federation.name } }
    assert_redirected_to federation_url(@federation)
  end

  test "should destroy federation" do
    assert_difference('Federation.count', -1) do
      delete federation_url(@federation)
    end

    assert_redirected_to federations_url
  end
end
