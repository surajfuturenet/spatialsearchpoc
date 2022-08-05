require "application_system_test_case"

class ConservationsTest < ApplicationSystemTestCase
  setup do
    @conservation = conservations(:one)
  end

  test "visiting the index" do
    visit conservations_url
    assert_selector "h1", text: "Conservations"
  end

  test "should create conservation" do
    visit conservations_url
    click_on "New conservation"

    fill_in "Address", with: @conservation.address
    fill_in "Description", with: @conservation.description
    fill_in "Latitude", with: @conservation.latitude
    fill_in "Longitude", with: @conservation.longitude
    fill_in "Name", with: @conservation.name
    fill_in "Partid", with: @conservation.partid
    fill_in "Pointid", with: @conservation.pointid
    fill_in "Polygonid", with: @conservation.polygonid
    click_on "Create Conservation"

    assert_text "Conservation was successfully created"
    click_on "Back"
  end

  test "should update Conservation" do
    visit conservation_url(@conservation)
    click_on "Edit this conservation", match: :first

    fill_in "Address", with: @conservation.address
    fill_in "Description", with: @conservation.description
    fill_in "Latitude", with: @conservation.latitude
    fill_in "Longitude", with: @conservation.longitude
    fill_in "Name", with: @conservation.name
    fill_in "Partid", with: @conservation.partid
    fill_in "Pointid", with: @conservation.pointid
    fill_in "Polygonid", with: @conservation.polygonid
    click_on "Update Conservation"

    assert_text "Conservation was successfully updated"
    click_on "Back"
  end

  test "should destroy Conservation" do
    visit conservation_url(@conservation)
    click_on "Destroy this conservation", match: :first

    assert_text "Conservation was successfully destroyed"
  end
end
