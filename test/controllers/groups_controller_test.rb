require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get updateAddStudent" do
    get groups_updateAddStudent_url
    assert_response :success
  end

end
