# frozen_string_literal: true

class LiveController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
