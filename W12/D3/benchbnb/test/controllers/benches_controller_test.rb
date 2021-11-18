require 'test_helper'

class BenchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get benches_index_url
    assert_response :success
  end

  test "should get create" do
    get benches_create_url
    assert_response :success
  end

end
