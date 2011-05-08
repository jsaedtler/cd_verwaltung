class TracksController < ApplicationController
  before_filter :login_required
  before_filter :get_resources

  def index
    @tracks = @album.tracks
  end

  def new
    @track = Track.new
  end

  def create
    @track = Track.new(params[:track])
    @track.album = @album
    if @track.save
      redirect_to artist_album_path(@artist,@album)
    else
      render :new
    end
  end

  private

  def get_resources
    @artist = current_user.artists.find_by_id(params[:artist_id])
    @album = @artist.albums.find_by_id(params[:album_id])
  end

end
