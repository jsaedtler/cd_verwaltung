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
      redirect_to select_redirect, :notice => 'Comment was successfully created.'
    else
      flash[:error] = 'Comment could not be created: ' + @comment.errors.full_messages.to_s
      redirect_to select_redirect
    end
  end

  private

  def select_redirect
    if current_user
      user_artist_album_path(current_user,@album.artist, @album)
    else
      user_album_path(@album.user, @album)
    end
  end

  def get_resources
    @album = Album.find_by_id(params[:album_id])
  end

end
