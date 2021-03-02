require 'test_helper'

class EnrolmentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get enrolment_index_url
    assert_response :success
  end

  test "should get show" do
    get enrolment_show_url
    assert_response :success
  end

  test "should get new" do
    get enrolment_new_url
    assert_response :success
  end

  test "should get edit" do
    get enrolment_edit_url
    assert_response :success
  end

end
