# frozen_string_literal: true

class CylinderHeadsController < ApplicationController
  before_action :set_cylinder_head, only: %i[show update destroy]

  # GET /cylinder_heads
  def index
    @cylinder_heads = CylinderHead.all

    render json: @cylinder_heads
  end

  # GET /cylinder_heads/1
  def show
    render json: @cylinder_head
  end

  # POST /cylinder_heads
  def create
    @cylinder_head = CylinderHead.new(cylinder_head_params)

    if @cylinder_head.save
      render json: @cylinder_head, status: :created, location: @cylinder_head
    else
      render json: @cylinder_head.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cylinder_heads/1
  def update
    if @cylinder_head.update(cylinder_head_params)
      render json: @cylinder_head
    else
      render json: @cylinder_head.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cylinder_heads/1
  def destroy
    @cylinder_head.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cylinder_head
    @cylinder_head = CylinderHead.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def cylinder_head_params
    params.require(:cylinder_head).permit(:brand, :reference, :material, :o_ring, :for_replica, :silenced, :weight,
                                          :price)
  end
end
