class MangasController < ApplicationController
  before_action :set_manga, only: %i[ show update destroy ]

  # GET /mangas
  def index
    @mangas = Manga.all

    render json: @mangas
  end

  # GET /mangas/1
  def show
    render json: @manga
  end

  # POST /mangas
  def create
    @manga = Manga.new(manga_params)

    if @manga.save
      render json: @manga, status: :created, location: @manga
    else
      render json: @manga.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mangas/1
  def update
    if @manga.update(manga_params)
      render json: @manga
    else
      render json: @manga.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mangas/1
  def destroy
    @manga.volumes.destroy_all
    @manga.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manga
      @manga = Manga.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def manga_params
      params.require(:manga).permit(:uuid, :original_title, :en_title, :pt_title, :released_chapters, :released_volumes, :author_id, :user_id)
    end
end
