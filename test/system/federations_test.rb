require "application_system_test_case"

class FederationsTest < ApplicationSystemTestCase
  setup do
    @federation = federations(:one)
  end

  test "visiting the index" do
    visit federations_url
    assert_selector "h1", text: "Federations"
  end

  test "creating a Federation" do
    @federation.name = 'WWE'
    visit federations_url
    click_on "New Federation"

    fill_in "Description", with: @federation.description
    fill_in "Name", with: @federation.name
    click_on "Create Federation"

    assert_text "Federation was successfully created"
    click_on "Back"
  end

  test "updating a Federation" do
    visit federations_url
    click_on "Edit", match: :first

    fill_in "Description", with: @federation.description
    fill_in "Name", with: @federation.name
    click_on "Update Federation"

    assert_text "Federation was successfully updated"
    click_on "Back"
  end

  test "destroying a Federation" do
    visit federations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Federation was successfully destroyed"
  end
end
