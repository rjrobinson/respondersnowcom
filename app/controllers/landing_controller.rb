# frozen_string_literal: true

class LandingController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    render layout: "empty"
  end

  def privacy
  end

  def terms_of_service
  end
end
