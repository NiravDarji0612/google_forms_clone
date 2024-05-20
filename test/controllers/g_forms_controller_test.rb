require "test_helper"

class GFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_form = g_forms(:one)
  end

  test "should get index" do
    get g_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_g_form_url
    assert_response :success
  end

  test "should create g_form" do
    assert_difference("GForm.count") do
      post g_forms_url, params: { g_form: { description: @g_form.description, title: @g_form.title } }
    end

    assert_redirected_to g_form_url(GForm.last)
  end

  test "should show g_form" do
    get g_form_url(@g_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_form_url(@g_form)
    assert_response :success
  end

  test "should update g_form" do
    patch g_form_url(@g_form), params: { g_form: { description: @g_form.description, title: @g_form.title } }
    assert_redirected_to g_form_url(@g_form)
  end

  test "should destroy g_form" do
    assert_difference("GForm.count", -1) do
      delete g_form_url(@g_form)
    end

    assert_redirected_to g_forms_url
  end
end
