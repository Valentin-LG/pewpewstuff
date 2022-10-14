class PersonalReplicasController < ApplicationController
  before_action :set_personal_replica, only: %i[ show update destroy ]

  # GET /personal_replicas
  def index
    @personal_replicas = PersonalReplica.all

    render json: @personal_replicas
  end

  # GET /personal_replicas/1
  def show
    render json: @personal_replica
  end

  # POST /personal_replicas
  def create
    @personal_replica = PersonalReplica.new(personal_replica_params)

    if @personal_replica.save
      render json: @personal_replica, status: :created, location: @personal_replica
    else render json: @personal_replica.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /personal_replicas/1
  def update
    if @personal_replica.update(personal_replica_params)
      render json: @personal_replica
    else render json: @personal_replica.errors, status: :unprocessable_entity
    end
  end

  # DELETE /personal_replicas/1
  def destroy
    @personal_replica.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personal_replica
    @personal_replica = PersonalReplica.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def personal_replica_params
    params.require(:personal_replica).permit(:user_id, :brand, :name, :reference, :category, :price, :barrel_id, :hop_up_unit_id, :joint_hop_up_id, :personal_gearbox_id)
  end
end
