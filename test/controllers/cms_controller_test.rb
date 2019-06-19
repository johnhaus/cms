require 'test_helper'

class CmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cms_index_url
    assert_response :success
  end

end
