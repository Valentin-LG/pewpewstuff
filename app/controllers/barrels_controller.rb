class BarrelsController < ApplicationController
  before_action :set_barrel, only: %i[ show update destroy ]

  # GET /barrels
  def index
    @barrels = Barrel.all

    render json: @barrels
  end

  # GET /barrels/1
  def show
    render json: @barrel
  end

  # POST /barrels
  def create
    @barrel = Barrel.new(barrel_params)

    if @barrel.save
      render json: @barrel, status: :created, location: @barrel
    else
      render json: @barrel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /barrels/1
  def update
    if @barrel.update(barrel_params)
      render json: @barrel
    else
      render json: @barrel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /barrels/1
  def destroy
    @barrel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barrel
      @barrel = Barrel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barrel_params
      params.require(:barrel).permit(:brand, :reference, :material, :length, :diameter, :compatibility, :price)
    end
end
