# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :validate_user, only: [:edit, :update, :work_histories, :certifications]


  def auth
    render layout: 'empty'
  end

  def work_histories
    @wh = WorkHistory.new
  end

  def certifications
    @certification = AcquiredCertification.new
  end

  def settings
    # will use the current_user as the data set. user/settings.
  end

  def edit
  end

  def update
    if User.find(params[:id]).update_attributes(user_params)
      redirect_back(fallback_location: root_path, flash: { notice: 'Setting Updated' })
    else
      redirect_back(fallback_location: root_path, flash: { notice: 'Nothing updated' })
    end
  end


  private


    def validate_user
      @user = User.find(params[:id] || params[:user_id])
      unless @user == current_user
        redirect_back(fallback_location: root_path, flash: { error: 'You are not authorized to access this page' })
      end
    end

    def user_params
      params.require(:user).permit(:zipcode)
    end
end
