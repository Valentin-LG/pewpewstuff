class NozzlesController < ApplicationController
  before_action :set_nozzle, only: %i[ show update destroy ]

  # GET /nozzles
  def index
    @nozzles = Nozzle.all

    render json: @nozzles
  end

  # GET /nozzles/1
  def show
    render json: @nozzle
  end

  # POST /nozzles
  def create
    @nozzle = Nozzle.new(nozzle_params)

    if @nozzle.save
      render json: @nozzle, status: :created, location: @nozzle
    else
      render json: @nozzle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /nozzles/1
  def update
    if @nozzle.update(nozzle_params)
      render json: @nozzle
    else
      render json: @nozzle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /nozzles/1
  def destroy
    @nozzle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nozzle
      @nozzle = Nozzle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nozzle_params
      params.require(:nozzle).permit(:brand, :reference, :material, :o_ring, :for_replica, :weight, :length, :price)
    end
end
