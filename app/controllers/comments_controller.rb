class CommentsController < ApplicationController
  before_filter :get_resources

  def index
    @comments = @album.comments
  end

  def new
  end

  def create
    @comment = Comment.new(params[:comment])
    @comment.album = @album
    if @comment.save
      redirect_to artist_album_path(@artist, @album), :notice => 'Comment was successfully created.'
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
