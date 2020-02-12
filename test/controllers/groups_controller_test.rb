require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get groups_edit_url
    assert_response :success
  end

end
