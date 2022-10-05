# frozen_string_literal: true

class JointHopUpsController < ApplicationController
  before_action :set_joint_hop_up, only: %i[show update destroy]

  # GET /joint_hop_ups
  def index
    @joint_hop_ups = JointHopUp.all

    render json: @joint_hop_ups
  end

  # GET /joint_hop_ups/1
  def show
    render json: @joint_hop_up
  end

  # POST /joint_hop_ups
  def create
    @joint_hop_up = JointHopUp.new(joint_hop_up_params)

    if @joint_hop_up.save
      render json: @joint_hop_up, status: :created, location: @joint_hop_up
    else
      render json: @joint_hop_up.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /joint_hop_ups/1
  def update
    if @joint_hop_up.update(joint_hop_up_params)
      render json: @joint_hop_up
    else
      render json: @joint_hop_up.errors, status: :unprocessable_entity
    end
  end

  # DELETE /joint_hop_ups/1
  def destroy
    @joint_hop_up.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_joint_hop_up
    @joint_hop_up = JointHopUp.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def joint_hop_up_params
    params.require(:joint_hop_up).permit(:brand, :reference, :material, :length, :toughness, :compatibility, :price)
  end
end
