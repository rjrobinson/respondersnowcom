# frozen_string_literal: true

# LiveController builds the live map
class LiveController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
