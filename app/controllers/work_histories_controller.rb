class WorkHistoriesController < ApplicationController


  def new
    @wh = WorkHistory.new
  end

  def create
    @wh = WorkHistory.new(work_history_params)
  end

  def update

  end

  def edit

  end

  def destory

  end

  def work_history_params
    
  end
end