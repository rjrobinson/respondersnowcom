class RespondersController < ApplicationController
  def auth
    render :layout => 'empty'
  end

  def work_histories
    @wh = WorkHistory.new
  end

  def certifications
    @certification = AquiredCertification.new
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

  def responder_params
    params.require(:responder).permit(:zipcode)
  end
end
