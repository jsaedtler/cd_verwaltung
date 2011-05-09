class ArtistsController < ApplicationController
  before_filter :login_required, :except => :index
  before_filter :get_resources
  def index
  end

  def new
    @artist = Artist.new(:name => 'new artist')
  end

  def create
    @artist = Artist.new(params[:artist])
    @artist.user = current_user

    if @artist.save
      redirect_to user_artists_path(@user)
    else
      render :new
    end
  end

  private

  def get_resources
    if current_user
      @artists = current_user.artists
    else
      @artists = User.find(params[:user_id]).artists
    end
  end

end
