class SongsController < ApplicationController
  before_action :set_song, only: %i[ show ]

  # GET /songs or /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1 or /songs/1.json
  def show
    render 'generic/songs/show'
  end

  # GET /songs/new

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:title, :genre, :release_date, :duration, artist_ids: [])
    end
end
