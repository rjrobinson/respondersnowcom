class CertificationsController < ApplicationController

  def index
  end

  def create
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

  end
end

# resources :aquired_certifications, only: [:create, :destroy, :update, :edit]
