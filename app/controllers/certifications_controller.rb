# frozen_string_literal: true

class CertificationsController < ApplicationController
  def index
    @certifications = Certification.all.order(:name)
  end

  def create
    @certification = Certification.new(cert_params)

    if @certification.save
      redirect_back(fallback_location: root_path, flash: { notice: "Added #{@certification.name}" })
    else
      redirect_back(fallback_location: root_path, flash: { error: "#{params[:name]} Not Added" })
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
      params.require(:certification).permit(
        :name,
          :course_code,
          :primary,
          :abbvr,
          :logo
      ).merge(creator: current_user)
      end
end
