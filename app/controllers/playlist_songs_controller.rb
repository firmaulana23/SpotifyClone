class PlaylistSongsController < ApplicationController
  before_action :set_playlist_song, only: %i[ show edit update destroy ]

  # GET /playlist_songs or /playlist_songs.json
  def index
    @playlist_songs = PlaylistSong.all
  end

  # GET /playlist_songs/1 or /playlist_songs/1.json
  def show
  end

  # GET /playlist_songs/new
  def new
    @playlist_song = PlaylistSong.new
  end

  # GET /playlist_songs/1/edit
  def edit
  end

  # POST /playlist_songs or /playlist_songs.json
  def create
    @playlist_song = PlaylistSong.new(playlist_song_params)

    respond_to do |format|
      if @playlist_song.save
        format.html { redirect_to playlist_song_url(@playlist_song), notice: "Playlist song was successfully created." }
        format.json { render :show, status: :created, location: @playlist_song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @playlist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /playlist_songs/1 or /playlist_songs/1.json
  def update
    respond_to do |format|
      if @playlist_song.update(playlist_song_params)
        format.html { redirect_to playlist_song_url(@playlist_song), notice: "Playlist song was successfully updated." }
        format.json { render :show, status: :ok, location: @playlist_song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @playlist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /playlist_songs/1 or /playlist_songs/1.json
  def destroy
    @playlist_song.destroy!

    respond_to do |format|
      format.html { redirect_to playlist_songs_url, notice: "Playlist song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_playlist_song
      @playlist_song = PlaylistSong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def playlist_song_params
      params.require(:playlist_song).permit(:song_id, :playlist_id)
    end
end
