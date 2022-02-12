# frozen_string_literal: true

# LandingController is the controller for the landing pages
class LandingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    render(layout: "empty")
  end

  def privacy; end

  def terms_of_service; end
end
