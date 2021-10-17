# frozen_string_literal: true

class CitiesController < ApplicationController
  before_action :set_city, only: %i[show update destroy]

  def index
    render json: Locations::City.all
  end

  def create
    render json: Locations::City.create!(params.require(:city).permit(create_params))
  end

  def show
    render json: @city
  end

  def update
    @city.update!(params.require(:city).permit(update_params))
    render json: @city
  end

  def destroy
    render json: @city.destroy!
  end

  private

  def create_params
    %i[name]
  end

  def update_params
    %i[name money]
  end

  def set_city
    @city = Locations::City.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :not_found
  end
end
