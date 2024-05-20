require "application_system_test_case"

class GFormsTest < ApplicationSystemTestCase
  setup do
    @g_form = g_forms(:one)
  end

  test "visiting the index" do
    visit g_forms_url
    assert_selector "h1", text: "G forms"
  end

  test "should create g form" do
    visit g_forms_url
    click_on "New g form"

    fill_in "Description", with: @g_form.description
    fill_in "Title", with: @g_form.title
    click_on "Create G form"

    assert_text "G form was successfully created"
    click_on "Back"
  end

  test "should update G form" do
    visit g_form_url(@g_form)
    click_on "Edit this g form", match: :first

    fill_in "Description", with: @g_form.description
    fill_in "Title", with: @g_form.title
    click_on "Update G form"

    assert_text "G form was successfully updated"
    click_on "Back"
  end

  test "should destroy G form" do
    visit g_form_url(@g_form)
    click_on "Destroy this g form", match: :first

    assert_text "G form was successfully destroyed"
  end
end
