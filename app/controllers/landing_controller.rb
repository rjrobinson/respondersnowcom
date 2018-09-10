class LandingController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    render :layout => "empty"
  end

  def privacy

  end
end