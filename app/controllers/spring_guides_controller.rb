# frozen_string_literal: true

class SpringGuidesController < ApplicationController
  before_action :set_spring_guide, only: %i[show update destroy]

  # GET /spring_guides
  def index
    @spring_guides = SpringGuide.all

    render json: @spring_guides
  end

  # GET /spring_guides/1
  def show
    render json: @spring_guide
  end

  # POST /spring_guides
  def create
    @spring_guide = SpringGuide.new(spring_guide_params)

    if @spring_guide.save
      render json: @spring_guide, status: :created, location: @spring_guide
    else
      render json: @spring_guide.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spring_guides/1
  def update
    if @spring_guide.update(spring_guide_params)
      render json: @spring_guide
    else
      render json: @spring_guide.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spring_guides/1
  def destroy
    @spring_guide.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_spring_guide
    @spring_guide = SpringGuide.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def spring_guide_params
    params.require(:spring_guide).permit(:brand, :reference, :length, :quick_detach, :on_bearing, :weight, :price)
  end
end
