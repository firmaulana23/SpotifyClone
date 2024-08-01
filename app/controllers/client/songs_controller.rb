class Client::SongsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_song, only: [:show, :index, :like, :unlike]
  def index
    @songs = Song.all
  end

  def show
  end

  def like
    # Ensure that @song is set correctly
    current_user.liked_songs.create(song: @song)
    respond_to do |format|
      format.html { redirect_to client_songs_path, notice: 'Song liked.' }
      format.js   # This will look for a corresponding .js.erb view
      end
  end

  def unlike
    current_user.liked_songs.find_by(song: @song)&.destroy
    respond_to do |format|
      format.html { redirect_to client_songs_path, notice: 'Song unliked.' }
      format.js   # This will look for a corresponding .js.erb view
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:title, :genre, :release_date, :duration, :audio, :image, artist_ids: [])
    end
end
