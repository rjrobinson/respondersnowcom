class WorkHistoriesController < ApplicationController


  def new
    @wh = WorkHistory.new
  end

  def create
    @wh = WorkHistory.new(work_history_params)
    if @wh.save
      redirect_to new_work_history_path, notice: 'Work History Added'
    end
  end

  def update

  end

  def edit

  end

  def destroy
    WorkHistory.find(params[:id]).destroy
    flash[:error] = 'Work History Deleted'
    redirect_to new_work_history_path
  end

  def work_history_params
    new = params.require(:work_history).permit!
    new.merge({
                  start_date: DateTime.new(
                      params[:work_history]['start_date(1i)'].to_i,
                      params[:work_history]['start_date(2i)'].to_i,
                  ),
                  end_date: DateTime.new(
                      params[:work_history]['end_date(1i)'].to_i,
                      params[:work_history]['end_date(2i)'].to_i,
                  ),
                  responder_id: current_responder.id
              }
    )
  end
end
