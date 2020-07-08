require 'test_helper'

class Api::V1::PhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @photo = photos(:one)
  end

  test "should get index" do
    get api_v1_photos_url, as: :json
    assert_response :success
  end

  test "should create photo" do
    assert_difference('Photo.count') do
      post api_v1_photos_url, params: { photo: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show photo" do
    get api_v1_photo_url(@photo), as: :json
    assert_response :success
  end

  test "should update photo" do
    patch api_v1_photo_url(@photo), params: { photo: {  } }, as: :json
    assert_response 200
  end

  test "should destroy photo" do
    assert_difference('Photo.count', -1) do
      delete api_v1_photo_url(@photo), as: :json
    end

    assert_response 204
  end
end
