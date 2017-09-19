require 'test_helper'

class MusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @muser = musers(:one)
  end

  test "should get index" do
    get musers_url, as: :json
    assert_response :success
  end

  test "should create muser" do
    assert_difference('Muser.count') do
      post musers_url, params: { muser: { game: @muser.game, genera: @muser.genera, hours: @muser.hours, name: @muser.name } }, as: :json
    end

    assert_response 201
  end

  test "should show muser" do
    get muser_url(@muser), as: :json
    assert_response :success
  end

  test "should update muser" do
    patch muser_url(@muser), params: { muser: { game: @muser.game, genera: @muser.genera, hours: @muser.hours, name: @muser.name } }, as: :json
    assert_response 200
  end

  test "should destroy muser" do
    assert_difference('Muser.count', -1) do
      delete muser_url(@muser), as: :json
    end

    assert_response 204
  end
end
