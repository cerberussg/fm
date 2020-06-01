require "application_system_test_case"

class ShowsTest < ApplicationSystemTestCase
  setup do
    @show = shows(:one)
  end

  test "visiting the index" do
    visit federation_shows_url(@show.federation_id)
    assert_selector "h1", text: "Shows"
  end

  test "creating a Show" do
    @show.name = "Fuck You All"
    visit federation_shows_url(@show)
    click_on "New Show"

    fill_in "Day of week", with: @show.day_of_week
    fill_in "Name", with: @show.name
    fill_in "Number of matches", with: @show.number_of_matches
    click_on "Create Show"

    assert_text "Show was successfully created"
    click_on "Back"
  end

  test "updating a Show" do
    visit federation_shows_url(@show.federation_id)
    click_on "Edit", match: :first

    fill_in "Day of week", with: @show.day_of_week
    fill_in "Name", with: @show.name
    fill_in "Number of matches", with: @show.number_of_matches
    click_on "Update Show"

    assert_text "Show was successfully updated"
    click_on "Back"
  end

  test "destroying a Show" do
    visit federation_shows_url(@show.federation_id)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Show was successfully destroyed"
  end
end
