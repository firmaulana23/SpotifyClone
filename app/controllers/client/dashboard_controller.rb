class Client::DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @songs = Song.all
  end
end
