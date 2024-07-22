class AlbumSongsController < ApplicationController
  before_action :set_album_song, only: %i[ show edit update destroy ]

  # GET /album_songs or /album_songs.json
  def index
    @album_songs = AlbumSong.all
  end

  # GET /album_songs/1 or /album_songs/1.json
  def show
  end

  # GET /album_songs/new
  def new
    @album_song = AlbumSong.new
  end

  # GET /album_songs/1/edit
  def edit
  end

  # POST /album_songs or /album_songs.json
  def create
    @album_song = AlbumSong.new(album_song_params)

    respond_to do |format|
      if @album_song.save
        format.html { redirect_to album_song_url(@album_song), notice: "Album song was successfully created." }
        format.json { render :show, status: :created, location: @album_song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @album_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /album_songs/1 or /album_songs/1.json
  def update
    respond_to do |format|
      if @album_song.update(album_song_params)
        format.html { redirect_to album_song_url(@album_song), notice: "Album song was successfully updated." }
        format.json { render :show, status: :ok, location: @album_song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @album_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_songs/1 or /album_songs/1.json
  def destroy
    @album_song.destroy!

    respond_to do |format|
      format.html { redirect_to album_songs_url, notice: "Album song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album_song
      @album_song = AlbumSong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_song_params
      params.require(:album_song).permit(:song_id, :album_id)
    end
end
