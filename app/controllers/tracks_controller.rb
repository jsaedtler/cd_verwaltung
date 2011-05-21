class TracksController < ApplicationController
  before_filter :login_required, :except => :search
  before_filter :get_resources

  def index
    @tracks = @album.tracks
  end

  def new
    @track = @album.tracks.new
  end

  def create
    @track = @album.tracks.build(params[:track])

    if @track.save
      redirect_to user_artist_album_path(@user, @artist,@album), :notice => 'Track was successfully created.'
    else
      flash.now[:error] ='Track could not be created'
      render :new
    end
  end

  def search
    @tracks = Track.search(params[:track_search][:query].to_s)
    render :index
  end

  private

  def get_resources
    @artist = current_user.artists.find_by_id(params[:artist_id]) if params[:artist_id]
    @album = @artist.albums.find_by_id(params[:album_id]) if params[:album_id]
  end

end
