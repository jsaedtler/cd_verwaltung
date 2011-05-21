class CommentsController < ApplicationController
  before_filter :get_resources

  def index
    @comments = @album.comments
  end

  def new
  end

  def create
    @comment = @album.comments.build(params[:comment])
    @comment.user = current_user if current_user
    if @comment.save
      if current_user
        redirect_to user_artist_album_path(current_user,@album.artist, @album), :notice => 'Comment was successfully created.'
      else
        redirect_to user_album_path(@album.user, @album), :notice => 'Comment was successfully created.'
      end
    else
      render :new
    end
  end

  private

  def get_resources
    @album = Album.find_by_id(params[:album_id])
  end

end
