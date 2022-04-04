require "test_helper"

class MangasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manga = mangas(:one)
  end

  test "should get index" do
    get mangas_url, as: :json
    assert_response :success
  end

  test "should create manga" do
    assert_difference("Manga.count") do
      post mangas_url, params: { manga: { author_id: @manga.author_id, chapters: @manga.chapters, en_title: @manga.en_title, original_title: @manga.original_title, pt_title: @manga.pt_title, user_id: @manga.user_id, uuid: @manga.uuid, volumes: @manga.volumes } }, as: :json
    end

    assert_response :created
  end

  test "should show manga" do
    get manga_url(@manga), as: :json
    assert_response :success
  end

  test "should update manga" do
    patch manga_url(@manga), params: { manga: { author_id: @manga.author_id, chapters: @manga.chapters, en_title: @manga.en_title, original_title: @manga.original_title, pt_title: @manga.pt_title, user_id: @manga.user_id, uuid: @manga.uuid, volumes: @manga.volumes } }, as: :json
    assert_response :success
  end

  test "should destroy manga" do
    assert_difference("Manga.count", -1) do
      delete manga_url(@manga), as: :json
    end

    assert_response :no_content
  end
end
