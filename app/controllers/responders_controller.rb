class RespondersController < ApplicationController
  def auth
    render :layout => 'empty'
  end

  def work_histories
    @wh = WorkHistory.new
  end
end
