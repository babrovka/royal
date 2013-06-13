require 'test_helper'

class ProceduresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
