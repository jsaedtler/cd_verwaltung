class TracksController < ApplicationController
  before_filter :login_required
  before_filter :get_resources

  def index
    @tracks = @album.tracks
  end

  def new
    @track = @album.tracks.new
  end

  def create
    @track = Track.new(params[:track])
    @track.album = @album
    if @track.save
      redirect_to user_artist_album_path(@user, @artist,@album), :notice => 'Track was successfully created.'
    else
      render :new
    end
  end

  def search
    @tracks = Track.find(:all,
                    :include => {:album => :artist},
                    :conditions => [
                           "tracks.title like :query or artists.name like :query",
                           {:query => "%#{params[:search][:query].to_s}%"}])
    render :index
  end

  private

  def get_resources
    @artist = current_user.artists.find_by_id(params[:artist_id]) if params[:artist_id]
    @album = @artist.albums.find_by_id(params[:album_id]) if params[:album_id]
  end

end
