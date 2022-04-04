class VolumesController < ApplicationController
  before_action :set_volume, only: %i[ show update destroy ]

  # GET /volumes
  def index
    @volumes = Volume.all

    render json: @volumes
  end

  # GET /volumes/1
  def show
    render json: @volume
  end

  # POST /volumes
  def create
    @volume = Volume.new(volume_params)

    if @volume.save
      render json: @volume, status: :created, location: @volume
    else
      render json: @volume.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /volumes/1
  def update
    if @volume.update(volume_params)
      render json: @volume
    else
      render json: @volume.errors, status: :unprocessable_entity
    end
  end

  # DELETE /volumes/1
  def destroy
    @volume.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volume
      @volume = Volume.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def volume_params
      params.require(:volume).permit(:uuid, :number, :cover, :volume_start, :volume_end, :release_date, :manga_id)
    end
end
