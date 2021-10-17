# frozen_string_literal: true

class CurrenciesController < ApplicationController
  before_action :set_currency, only: %i[show update destroy]

  def index
    render json: Currencies::Base.all
  end

  def create
    render json: Currencies::Base.create!(params.require(:currency).permit(create_params))
  end

  def show
    render json: @currency
  end

  def update
    @currency.update!(params.require(:currency).permit(update_params))
    render json: @currency
  end

  def destroy
    render json: @currency.destroy!
  end

  private

  def create_params
    %i[name abbreviation symbol]
  end

  def update_params
    %i[name abbreviation symbol]
  end

  def set_currency
    @currency = Currencies::Base.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, status: :not_found
  end
end
