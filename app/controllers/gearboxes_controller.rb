# frozen_string_literal: true

class GearboxesController < ApplicationController
  before_action :set_gearbox, only: %i[show update destroy]

  # GET /gearboxes
  def index
    @gearboxes = Gearbox.all

    render json: @gearboxes
  end

  # GET /gearboxes/1
  def show
    render json: @gearbox
  end

  # POST /gearboxes
  def create
    @gearbox = Gearbox.new(gearbox_params)

    if @gearbox.save
      render json: @gearbox, status: :created, location: @gearbox
    else
      render json: @gearbox.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gearboxes/1
  def update
    if @gearbox.update(gearbox_params)
      render json: @gearbox
    else
      render json: @gearbox.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gearboxes/1
  def destroy
    @gearbox.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_gearbox
    @gearbox = Gearbox.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def gearbox_params
    params.require(:gearbox).permit(:brand, :reference, :version, :quick_detach, :blowback, :reinfored, :price)
  end
end
