class AlbumsController < ApplicationController
  before_filter :login_required, :only => [:edit, :update, :new, :create]
  before_filter :get_user
  before_filter :get_artist
  before_filter :get_album, :only => [:edit, :update, :show]

  def index
    if @artist
      @albums = @artist.albums
    else
      @albums = @user.albums
    end
  end

  def new
    @album = @artist.albums.new(:title => 'new album')
  end

  def show
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @album.update_attributes(params[:album])
      redirect_to user_artist_album_path(@user, @artist, @album), :notice => 'Album was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @album = Album.new(params[:album])
    @album.artist = @artist
    if @album.save
      redirect_to user_artist_album_path(@user, @artist, @album), :notice => 'Album was successfully created.'
    else
      render :new
    end
  end

  def search
    @albums = Album.search(params[:album_search][:query].to_s)
    render :index
  end
  
  private

  def get_artist
    @artist = @user.artists.find_by_id(params[:artist_id]) if params[:artist_id]
  end
  
  def get_album
    @album = Album.find_by_id(params[:id], :include => [:tracks, :comments], :include => :tracks)
  end

  def get_user
    @user = User.find_by_id(params[:user_id])
  end

end
