# frozen_string_literal: true

class AcquiredCertificationsController < ApplicationController
  before_action :only_user_can_modify, only: [:destroy, :update]

  def new
    @certification = AcquiredCertification.new
  end

  def create
    @certification = AcquiredCertification.new(cert_params)
    if @certification.save
      redirect_back(fallback_location: root_path,
                    flash: { notice: "#{@certification.certification.name} Added to your profile!" })
    else
      redirect_back(fallback_location: root_path,
                    flash: { error: 'Looks like there was an error' })
    end
  end

  def destroy
    AcquiredCertification.find(params[:id]).destroy
    redirect_back(fallback_location: root_path, flash: { error: 'Removed' })
  end

  def update
  end

  def edit
  end

  private

  def cert_params
    new = params.require(:acquired_certification).permit!
    new = new.merge(
      acquired_on: DateTime.new(
        params[:acquired_certification]['acquired_on(1i)'].to_i,
          params[:acquired_certification]['acquired_on(2i)'].to_i,
      ),
      user_id: current_user.id,
    )

    if params[:acquired_certification][:expires]
      new = new.merge(expires_on: DateTime.new(
        params[:acquired_certification]['expires_on(1i)'].to_i,
          params[:acquired_certification]['expires_on(2i)'].to_i,
      ))
    end
    new = new.merge(user: current_user)

    new
  end

  def only_user_can_modify
    cert = AcquiredCertification.find(params[:id])
    unless cert.user == current_user
      flash[:error] = 'You dont have permission for that'
      redirect_back(fallback_location: root_path)
    end
  end
end
