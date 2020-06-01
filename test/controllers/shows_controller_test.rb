require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @show = shows(:one)
  end

  test "should get index" do
    get federation_shows_url(@show.federation_id)
    assert_response :success
  end

  test "should get new" do
    get new_federation_show_url(@show.federation_id)
    assert_response :success
  end

  test "should create show" do
    assert_difference('Show.count') do
      @show.name = 'Smashmouth Saturday'
      post federation_shows_url(@show), params: { show: { federation_id: @show.federation_id, day_of_week: @show.day_of_week, name: @show.name, number_of_matches: @show.number_of_matches } }
    end

    assert_redirected_to federation_shows_url(@show)
  end

  test "should show show" do
    get federation_show_url(@show.federation_id, @show)
    assert_response :success
  end

  test "should get edit" do
    get edit_federation_show_url(@show.federation_id, @show)
    assert_response :success
  end

  test "should update show" do
    patch federation_show_url(@show.federation_id, @show), params: { show: { federation_id: @show.federation_id, day_of_week: @show.day_of_week, name: @show.name, number_of_matches: @show.number_of_matches } }
    assert_redirected_to federation_shows_url(@show)
  end

  test "should destroy show" do
    assert_difference('Show.count', -1) do
      delete federation_show_url(@show.federation_id, @show)
    end

    assert_redirected_to federation_shows_url
  end
end
