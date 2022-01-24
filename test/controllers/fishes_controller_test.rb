require 'test_helper'

class FishesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fishes_index_url
    assert_response :success
  end

  test "should get show" do
    get fishes_show_url
    assert_response :success
  end

  test "should get new" do
    get fishes_new_url
    assert_response :success
  end

  test "should get edit" do
    get fishes_edit_url
    assert_response :success
  end

end
