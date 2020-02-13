require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get deleteStudent" do
    get groups_deleteStudent_url
    assert_response :success
  end

end
