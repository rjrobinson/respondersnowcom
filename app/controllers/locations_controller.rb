# frozen_string_literal: true

# Crus operations for locations
class LocationsController < ApplicationController
  def index
    @locations = if params[:search].present?
      Location.near(params[:search], 50, order: "distance")
    else
      Location.all
    end
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to(@location, notice: "Successfully created location.")
    else
      render(action: "new")
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update(params[:location])
      redirect_to(@location, notice: "Successfully updated location.")
    else
      render(action: "edit")
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to(locations_url, notice: "Successfully destroyed location.")
  end

  private

  def location_params
    s
  end
end
