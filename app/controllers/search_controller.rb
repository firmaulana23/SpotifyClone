class SearchController < ApplicationController
  def index
    @query = params(:query)
    @artists = Artist.where("name LIKE ?", "%#{@query}%")
    @album = Album.where("name LIKE ?", "%#{@query}%")
    @song = Song.where("name LIKE ?", "%#{@query}%")
  end
end
