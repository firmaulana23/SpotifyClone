class Client::LikedSongsController < ApplicationController
  before_action :authenticate_user!
  def index
    @songs = Song.all
  end
end
