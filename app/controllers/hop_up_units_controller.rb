# frozen_string_literal: true

class HopUpUnitsController < ApplicationController
  before_action :set_hop_up_unit, only: %i[show update destroy]

  # GET /hop_up_units
  def index
    @hop_up_units = HopUpUnit.all

    render json: @hop_up_units
  end

  # GET /hop_up_units/1
  def show
    render json: @hop_up_unit
  end

  # POST /hop_up_units
  def create
    @hop_up_unit = HopUpUnit.new(hop_up_unit_params)

    if @hop_up_unit.save
      render json: @hop_up_unit, status: :created, location: @hop_up_unit
    else
      render json: @hop_up_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hop_up_units/1
  def update
    if @hop_up_unit.update(hop_up_unit_params)
      render json: @hop_up_unit
    else
      render json: @hop_up_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hop_up_units/1
  def destroy
    @hop_up_unit.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_hop_up_unit
    @hop_up_unit = HopUpUnit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def hop_up_unit_params
    params.require(:hop_up_unit).permit(:brand, :reference, :material, :for_replica, :weight, :price)
  end
end
