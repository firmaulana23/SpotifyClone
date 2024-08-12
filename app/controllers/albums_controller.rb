class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show ]

  # GET /albums or /albums.json
  def index
    @albums = Album.all
  end

  # GET /albums/1 or /albums/1.json
  def show
    render 'generic/albums/show'
  end

  # GET /albums/new
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:name, :release_date, song_ids: [])
    end
end
