class CertificationsController < ApplicationController

  def index
  end

  def create
    @certification = Certification.new(cert_params)
    @certification.creator = current_responder

    if @certification.save
      redirect_back(fallback_location: root_path, flash: {notice: "#{@certification.name}"})
    else
      redirect_back(fallback_location: root_path, flash: {error: "#{params[:name]} Not Added"})
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def new
    @certification = Certification.new
  end

  private

  def cert_params
    params.require(:certification).permit(:name)
  end
end
