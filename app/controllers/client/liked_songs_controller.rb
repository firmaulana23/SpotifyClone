class Client::LikedSongsController < ApplicationController
  before_action :authenticate_user! # Ensure the user is logged in
  before_action :set_song, only: [:create, :destroy]

  def show
  end

  def create
    # Find or create a like for the current user and the specified song
    liked_song = current_user.liked_songs.new(song: @song)

    if liked_song.save
      flash[:notice] = "Song liked successfully."
    else
      flash[:alert] = "Unable to like song."
    end

    redirect_to request.referrer || root_path
  end

  def destroy
    # Find the liked song record for the current user and specified song
    liked_song = current_user.liked_songs.find_by(song: @song)

    if liked_song.destroy
      flash[:notice] = "Song unliked successfully."
    else
      flash[:alert] = "Unable to unlike song."
    end

    redirect_to request.referrer || root_path
  end

  private

  def set_song
    @song = Song.friendly.find(params[:song_id])
  end
end
