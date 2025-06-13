require "test_helper"

class LegacyRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get legacy_records_index_url
    assert_response :success
  end

  test "should get show" do
    get legacy_records_show_url
    assert_response :success
  end

  test "should get new" do
    get legacy_records_new_url
    assert_response :success
  end

  test "should get edit" do
    get legacy_records_edit_url
    assert_response :success
  end
end
