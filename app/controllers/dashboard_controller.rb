class DashboardController < ApplicationController
  def index
    @songs = Song.all
  end

  def search
    @query = params[:query]
    if @query.present?
      @artists = Artist.where("name LIKE ?", "%#{@query}%")
      @albums = Album.where("name LIKE ?", "%#{@query}%")
      @songs = Song.where("title LIKE ?", "%#{@query}%")
    else
      @artists = Artist.none
      @albums = Album.none
      @songs = Song.none
    end
  end
end