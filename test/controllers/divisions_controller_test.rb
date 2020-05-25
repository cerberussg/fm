require 'test_helper'

class DivisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @division = divisions(:one)
  end

  test "should get index" do
    get federation_divisions_url(@division.federation_id)
    assert_response :success
  end

  test "should get new" do
    get new_federation_division_url(@division.federation_id)
    assert_response :success
  end

  test "should create division" do
    assert_difference('Division.count') do
      @division.name = 'TNT Television'
      post federation_divisions_url(@division), params: { division: { federation_id: @division.federation_id, name: @division.name } }
    end

    assert_redirected_to federation_divisions_url(@division)
  end

  test "should show division" do
    get federation_division_url(federation_id: @division.federation_id, id: @division)
    assert_response :success
  end

  test "should get edit" do
    get edit_federation_division_url(@division.federation_id, @division)
    assert_response :success
  end

  test "should update division" do
    @division.name = 'TNT Television'
    patch federation_division_url(@division.federation_id, @division), params: { division: { federation_id: @division.federation_id, name: @division.name } }
    assert_redirected_to federation_divisions_url(@division)
  end

  test "should destroy division" do
    assert_difference('Division.count', -1) do
      delete federation_division_url(@division.federation_id, id: @division)
    end

    assert_redirected_to federation_divisions_url
  end
end
