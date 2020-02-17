require 'test_helper'

class GroupStudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get group_students_new_url
    assert_response :success
  end

  test "should get create" do
    get group_students_create_url
    assert_response :success
  end

  test "should get destroy" do
    get group_students_destroy_url
    assert_response :success
  end

end
