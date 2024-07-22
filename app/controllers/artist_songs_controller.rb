class ArtistSongsController < ApplicationController
  before_action :set_artist_song, only: %i[ show edit update destroy ]

  # GET /artist_songs or /artist_songs.json
  def index
    @artist_songs = ArtistSong.all
  end

  # GET /artist_songs/1 or /artist_songs/1.json
  def show
  end

  # GET /artist_songs/new
  def new
    @artist_song = ArtistSong.new
  end

  # GET /artist_songs/1/edit
  def edit
  end

  # POST /artist_songs or /artist_songs.json
  def create
    @artist_song = ArtistSong.new(artist_song_params)

    respond_to do |format|
      if @artist_song.save
        format.html { redirect_to artist_song_url(@artist_song), notice: "Artist song was successfully created." }
        format.json { render :show, status: :created, location: @artist_song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @artist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /artist_songs/1 or /artist_songs/1.json
  def update
    respond_to do |format|
      if @artist_song.update(artist_song_params)
        format.html { redirect_to artist_song_url(@artist_song), notice: "Artist song was successfully updated." }
        format.json { render :show, status: :ok, location: @artist_song }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @artist_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artist_songs/1 or /artist_songs/1.json
  def destroy
    @artist_song.destroy!

    respond_to do |format|
      format.html { redirect_to artist_songs_url, notice: "Artist song was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist_song
      @artist_song = ArtistSong.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def artist_song_params
      params.require(:artist_song).permit(:artist_id, :song_id)
    end
end
