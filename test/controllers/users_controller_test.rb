require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:kosuke)
    @other_user = users(:yamada)
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end
end
