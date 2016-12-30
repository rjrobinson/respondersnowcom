class AquiredCertificationsController < ApplicationController


  before_action :only_responder_can_modify, only: [:destroy, :update]

  def create
    @certification = AquiredCertification.new(cert_params)
    if @certification.save
      redirect_to :back, notice: "#{@certification.certification.name} Added to your profile!"
    end
  end

  def destroy
    AquiredCertification.find(params[:id]).destroy
    flash[:error] = 'Removed'
    redirect_to :back
  end

  def update
  end

  def edit
  end


  private

  def cert_params
    new = params.require(:aquired_certification).permit!
    new.merge(
        {
            aquired_on: DateTime.new(
                params[:aquired_certification]['aquired_on(1i)'].to_i,
                params[:aquired_certification]['aquired_on(2i)'].to_i,
            ),
            expires_on: DateTime.new(
                params[:aquired_certification]['expires_on(1i)'].to_i,
                params[:aquired_certification]['expires_on(2i)'].to_i,
            ),
            responder_id: current_responder.id,
        }
    )
  end

  def only_responder_can_modify
    cert = AquiredCertification.find(params[:id])
    unless cert.responder == current_responder
      flash[:error] = 'You dont have permission for that'
      redirect_back(fallback_location: root_path)
    end
  end

end