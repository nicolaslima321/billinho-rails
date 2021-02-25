require 'test_helper'

class InvoiceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get invoice_index_url
    assert_response :success
  end

  test "should get show" do
    get invoice_show_url
    assert_response :success
  end

  test "should get new" do
    get invoice_new_url
    assert_response :success
  end

  test "should get edit" do
    get invoice_edit_url
    assert_response :success
  end

end
