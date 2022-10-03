class CylindersController < ApplicationController
  before_action :set_cylinder, only: %i[ show update destroy ]

  # GET /cylinders
  def index
    @cylinders = Cylinder.all

    render json: @cylinders
  end

  # GET /cylinders/1
  def show
    render json: @cylinder
  end

  # POST /cylinders
  def create
    @cylinder = Cylinder.new(cylinder_params)

    if @cylinder.save
      render json: @cylinder, status: :created, location: @cylinder
    else
      render json: @cylinder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cylinders/1
  def update
    if @cylinder.update(cylinder_params)
      render json: @cylinder
    else
      render json: @cylinder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cylinders/1
  def destroy
    @cylinder.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cylinder
      @cylinder = Cylinder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cylinder_params
      params.require(:cylinder).permit(:brand, :reference, :material, :size, :diameter, :weigh, :drilled, :price)
    end
end
