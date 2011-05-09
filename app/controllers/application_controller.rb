require 'lib/authenticated_system'
class ApplicationController < ActionController::Base
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  protect_from_forgery

  before_filter :get_user

  private

  def get_user
    @user = current_user || User.find_by_id(params[:user_id])
  end
end
