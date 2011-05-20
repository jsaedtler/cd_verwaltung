class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  protect_from_forgery

  before_filter :get_user

  private

  def get_user
    @user = User.find_by_id(params[:user_id])
  end
end
