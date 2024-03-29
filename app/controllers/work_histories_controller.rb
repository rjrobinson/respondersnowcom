# frozen_string_literal: true

# WorkHistory Controller allows a user to manage their past history
class WorkHistoriesController < ApplicationController
  def create
    @wh = WorkHistory.new(work_history_params)
    redirect_back(fallback_location: root_path, flash: { notice: "Work History Added" }) if @wh.save
  end

  def destroy
    WorkHistory.find(params[:id]).destroy
    redirect_back(fallback_location: root_path, flash: { error: "Work History Deleted" })
  end

  def work_history_params
    new = params.require(:work_history).permit!
    new.merge(
      start_date: Time.zone.local(
        params[:work_history]["start_date(1i)"].to_i,
        params[:work_history]["start_date(2i)"].to_i
      ),
      end_date: Time.zone.local(
        params[:work_history]["end_date(1i)"].to_i,
        params[:work_history]["end_date(2i)"].to_i
      )
    )
    new["agency_id"] = Agency.find_by(name: new["agency_id"]).id
    new[:responder_id] = current_user.id
    new
  end
end
