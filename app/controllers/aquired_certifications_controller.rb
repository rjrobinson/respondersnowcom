class AquiredCertificationsController < ApplicationController
  def index
  end

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
    new.merge({
                  aquired: DateTime.new(
                      params[:aquired_certification]['aquired(1i)'].to_i,
                      params[:aquired_certification]['aquired(2i)'].to_i,
                  ),
                  expires: DateTime.new(
                      params[:aquired_certification]['expires(1i)'].to_i,
                      params[:aquired_certification]['expires(2i)'].to_i,
                  ),
                  responder_id: current_responder.id,
              }
    )
  end

end