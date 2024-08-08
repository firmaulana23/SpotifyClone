# app/controllers/client/playlists_controller.rb
class Client::PlaylistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @playlists = current_user.playlists
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      redirect_to client_playlists_path, notice: 'Playlist was successfully created.'
    else
      redirect_to client_playlists_path, alert: 'Failed to create playlist.'
      render :index
    end
  end

  def new
    @playlist = Playlist.new
    @playlist.playlist_songs.build
  end

  def show
    @playlist = current_user.playlists.find(params[:id])
    @songs = @playlist.songs
  end

  def add_song
    @playlist = current_user.playlists.find(params[:playlist_id])
    @song = Song.find(params[:song_id])
    if @playlist.songs << @song
      redirect_to client_song_path(@song), notice: 'Song added to playlist.'
    else
      redirect_to client_song_path(@song), alert: 'Failed to add song to playlist.'
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
