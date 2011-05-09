class AlbumsController < ApplicationController
  before_filter :get_artist
  before_filter :get_album, :only => [:edit, :update, :show]

  def index
    @albums = @artist.albums
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
      redirect_to artist_album_path(@artist, @album), :notice => 'Album was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @album = Album.new(params[:album])
    @album.artist = @artist
    if @album.save
      redirect_to artist_album_path(@artist, @album), :notice => 'Album was successfully created.'
    else
      render :new
    end
  end

  private

  def get_artist
    @artist = current_user.artists.find_by_id(params[:artist_id], :include => :albums)
  end
  
  def get_album
    @album = Album.find_by_id(params[:id], :include => [:tracks, :comments])
  end

end
