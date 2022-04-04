require "test_helper"

class UserMangasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_manga = user_mangas(:one)
  end

  test "should get index" do
    get user_mangas_url, as: :json
    assert_response :success
  end

  test "should create user_manga" do
    assert_difference("UserManga.count") do
      post user_mangas_url, params: { user_manga: { chapter_read: @user_manga.chapter_read, manga_id: @user_manga.manga_id, user_id: @user_manga.user_id, uuid: @user_manga.uuid, volume_bought: @user_manga.volume_bought, volume_read: @user_manga.volume_read } }, as: :json
    end

    assert_response :created
  end

  test "should show user_manga" do
    get user_manga_url(@user_manga), as: :json
    assert_response :success
  end

  test "should update user_manga" do
    patch user_manga_url(@user_manga), params: { user_manga: { chapter_read: @user_manga.chapter_read, manga_id: @user_manga.manga_id, user_id: @user_manga.user_id, uuid: @user_manga.uuid, volume_bought: @user_manga.volume_bought, volume_read: @user_manga.volume_read } }, as: :json
    assert_response :success
  end

  test "should destroy user_manga" do
    assert_difference("UserManga.count", -1) do
      delete user_manga_url(@user_manga), as: :json
    end

    assert_response :no_content
  end
end
