require 'test_helper'

class FusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fuser = fusers(:one)
  end

  test "should get index" do
    get fusers_url, as: :json
    assert_response :success
  end

  test "should create fuser" do
    assert_difference('Fuser.count') do
      post fusers_url, params: { fuser: { game: @fuser.game, genera: @fuser.genera, hours: @fuser.hours, name: @fuser.name } }, as: :json
    end

    assert_response 201
  end

  test "should show fuser" do
    get fuser_url(@fuser), as: :json
    assert_response :success
  end

  test "should update fuser" do
    patch fuser_url(@fuser), params: { fuser: { game: @fuser.game, genera: @fuser.genera, hours: @fuser.hours, name: @fuser.name } }, as: :json
    assert_response 200
  end

  test "should destroy fuser" do
    assert_difference('Fuser.count', -1) do
      delete fuser_url(@fuser), as: :json
    end

    assert_response 204
  end
end
