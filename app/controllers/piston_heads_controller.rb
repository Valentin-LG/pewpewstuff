class PistonHeadsController < ApplicationController
  before_action :set_piston_head, only: %i[ show update destroy ]

  # GET /piston_heads
  def index
    @piston_heads = PistonHead.all

    render json: @piston_heads
  end

  # GET /piston_heads/1
  def show
    render json: @piston_head
  end

  # POST /piston_heads
  def create
    @piston_head = PistonHead.new(piston_head_params)

    if @piston_head.save
      render json: @piston_head, status: :created, location: @piston_head
    else
      render json: @piston_head.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /piston_heads/1
  def update
    if @piston_head.update(piston_head_params)
      render json: @piston_head
    else
      render json: @piston_head.errors, status: :unprocessable_entity
    end
  end

  # DELETE /piston_heads/1
  def destroy
    @piston_head.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piston_head
      @piston_head = PistonHead.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def piston_head_params
      params.require(:piston_head).permit(:brand, :reference, :material, :silenced, :on_bearing, :weight, :price)
    end
end
