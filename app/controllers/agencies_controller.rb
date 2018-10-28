# frozen_string_literal: true

class AgenciesController < ApplicationController
  autocomplete :agency, :name

  def index
    @agencies = Agency.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @agencies.map(&:name) }
    end
  end

  def autocomplete_name
    @agency = Angency.select('id, name').where('name LIKE ?', "#{params[:name]}%").order(:name).limit(10)

    respond_to do |format|
      format.json { render json: @agency, only: [:id, :name] }
    end
  end
end
