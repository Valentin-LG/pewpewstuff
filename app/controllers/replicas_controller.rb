class ReplicasController < ApplicationController
  before_action :set_replica, only: %i[ show update destroy ]

  # GET /replicas
  def index
    @replicas = Replica.all

    render json: @replicas
  end

  # GET /replicas/1
  def show
    render json: @replica
  end

  # POST /replicas
  def create
    @replica = Replica.new(replica_params)

    if @replica.save
      render json: @replica, status: :created, location: @replica
    else
      render json: @replica.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /replicas/1
  def update
    if @replica.update(replica_params)
      render json: @replica
    else
      render json: @replica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /replicas/1
  def destroy
    @replica.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_replica
      @replica = Replica.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def replica_params
      params.require(:replica).permit(:brand, :name, :reference, :category, :price)
    end
end
