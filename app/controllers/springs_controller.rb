class SpringsController < ApplicationController
  before_action :set_spring, only: %i[ show update destroy ]

  # GET /springs
  def index
    @springs = Spring.all

    render json: @springs
  end

  # GET /springs/1
  def show
    render json: @spring
  end

  # POST /springs
  def create
    @spring = Spring.new(spring_params)

    if @spring.save
      render json: @spring, status: :created, location: @spring
    else
      render json: @spring.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /springs/1
  def update
    if @spring.update(spring_params)
      render json: @spring
    else
      render json: @spring.errors, status: :unprocessable_entity
    end
  end

  # DELETE /springs/1
  def destroy
    @spring.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spring
      @spring = Spring.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spring_params
      params.require(:spring).permit(:brand, :reference, :spires, :linear, :price)
    end
end
