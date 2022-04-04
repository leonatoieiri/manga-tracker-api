class UserMangasController < ApplicationController
  before_action :set_user_manga, only: %i[ show update destroy ]

  # GET /user_mangas
  def index
    @user_mangas = UserManga.all

    render json: @user_mangas
  end

  # GET /user_mangas/1
  def show
    render json: @user_manga
  end

  # POST /user_mangas
  def create
    @user_manga = UserManga.new(user_manga_params)

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
      @user_manga = UserManga.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_manga_params
      params.require(:user_manga).permit(:uuid, :chapter_read, :volume_read, :volume_bought, :manga_id, :user_id)
    end
end
