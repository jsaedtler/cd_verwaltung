class ArtistsController < ApplicationController
  before_filter :login_required

  def index
    @artists = current_user.artists
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])
    @artist.user = current_user

    if @artist.save
      redirect_to artists_path
    else
      render :new
    end
  end
end
