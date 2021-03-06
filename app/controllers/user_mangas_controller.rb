class UserMangasController < ApplicationController
  before_action :set_user_manga, only: %i[ show update destroy ]

  # GET /user_mangas
  def index
    @user_mangas = @current_user.user_mangas.joins(:manga)
    .select("mangas.original_title, mangas.released_chapters, mangas.released_volumes, user_mangas.id, user_mangas.chapter_read, user_mangas.volume_read, user_mangas.volume_bought")

    render json: @user_mangas
  end

  # GET /user_mangas/1
  def show
    render json: @user_manga
  end

  # POST /user_mangas
  def create
    @user_manga = UserManga.new(user_manga_params)
    @user_manga.user_id = @current_user.id

    if @user_manga.save
      render json: @user_manga, status: :created, location: @user_manga
    else
      render json: @user_manga.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_mangas/1
  def update
    if @user_manga.update(user_manga_params)
      render json: @user_manga
    else
      render json: @user_manga.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_mangas/1
  def destroy
    @user_manga.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_manga
      @user_manga = UserManga.find_by(id: params[:id], user_id: @current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def user_manga_params
      params.require(:user_manga).permit(:uuid, :chapter_read, :volume_read, :volume_bought, :manga_id)
    end
end
