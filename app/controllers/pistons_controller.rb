# frozen_string_literal: true

class PistonsController < ApplicationController
  before_action :set_piston, only: %i[show update destroy]

  # GET /pistons
  def index
    @pistons = Piston.all

    render json: @pistons
  end

  # GET /pistons/1
  def show
    render json: @piston
  end

  # POST /pistons
  def create
    @piston = Piston.new(piston_params)

    if @piston.save
      render json: @piston, status: :created, location: @piston
    else
      render json: @piston.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pistons/1
  def update
    if @piston.update(piston_params)
      render json: @piston
    else
      render json: @piston.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pistons/1
  def destroy
    @piston.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_piston
    @piston = Piston.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def piston_params
    params.require(:piston).permit(:brand, :reference, :teeth_number, :teeth_material, :material, :weight, :price)
  end
end
