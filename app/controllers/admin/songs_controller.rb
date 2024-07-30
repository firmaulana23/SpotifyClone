class Admin::SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  def index
    @songs = Song.all
  end
  def new
    @song = Song.new
    @song.artist_songs.build
  end

  def show
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to admin_songs_path, notice: 'Song was successfully created.'
    else
      render :new
    end
  end



  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to admin_song_url(@song), notice: "Song was successfully updated." }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @song.destroy!

    respond_to do |format|
      format.html { redirect_to admin_songs_url, notice: "Song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def song_params
      params.require(:song).permit(:title, :genre, :release_date, :duration, :file, :image, artist_ids: [])
    end
end
