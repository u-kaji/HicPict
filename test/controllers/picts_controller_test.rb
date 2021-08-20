require 'test_helper'

class PictsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get picts_index_url
    assert_response :success
  end

end
