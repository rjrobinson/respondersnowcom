class RespondersController < ApplicationController

  before_action :validate_responder, only: [:edit, :update, :work_histories, :certifications]


  def auth
    render :layout => 'empty'
  end

  def work_histories
    @wh = WorkHistory.new
  end

  def certifications
    @certification = AcquiredCertification.new
  end

  def edit
  end

  def update
    if Responder.find(params[:id]).update_attributes(responder_params)
      redirect_back(fallback_location: root_path, flash: {notice: 'Setting Updated'})
    else
      redirect_back(fallback_location: root_path, flash: {notice: 'Nothing updated'})
    end
  end


  private


  def validate_responder
    @responder = Responder.find(params[:id] || params[:responder_id])
    unless @responder == current_responder
      redirect_back(fallback_location: root_path, flash: {error: 'You are not authorized to access this page'})
    end
  end

  def responder_params
    params.require(:responder).permit(:zipcode)
  end
end
