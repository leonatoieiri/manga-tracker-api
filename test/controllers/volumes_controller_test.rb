require "test_helper"

class VolumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @volume = volumes(:one)
  end

  test "should get index" do
    get volumes_url, as: :json
    assert_response :success
  end

  test "should create volume" do
    assert_difference("volume.count") do
      post volumes_url, params: { volume: { volume_end: @volume.volume_end, volume_start: @volume.volume_start, cover: @volume.cover, manga_id: @volume.manga_id, number: @volume.number, release_date: @volume.release_date, uuid: @volume.uuid } }, as: :json
    end

    assert_response :created
  end

  test "should show volume" do
    get volume_url(@volume), as: :json
    assert_response :success
  end

  test "should update volume" do
    patch volume_url(@volume), params: { volume: { volume_end: @volume.volume_end, volume_start: @volume.volume_start, cover: @volume.cover, manga_id: @volume.manga_id, number: @volume.number, release_date: @volume.release_date, uuid: @volume.uuid } }, as: :json
    assert_response :success
  end

  test "should destroy volume" do
    assert_difference("volume.count", -1) do
      delete volume_url(@volume), as: :json
    end

    assert_response :no_content
  end
end
