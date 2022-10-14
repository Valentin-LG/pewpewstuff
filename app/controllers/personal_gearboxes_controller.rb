class PersonalGearboxesController < ApplicationController
  before_action :set_personal_gearbox, only: %i[ show update destroy ]

  # GET /personal_gearboxes
  def index
    @personal_gearboxes = PersonalGearbox.all

    render json: @personal_gearboxes
  end

  # GET /personal_gearboxes/1
  def show
    render json: @personal_gearbox
  end

  # POST /personal_gearboxes
  def create
    @personal_gearbox = PersonalGearbox.new(personal_gearbox_params)

    if @personal_gearbox.save
      render json: @personal_gearbox, status: :created, location: @personal_gearbox
    else render json: @personal_gearbox.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /personal_gearboxes/1
  def update
    if @personal_gearbox.update(personal_gearbox_params)
      render json: @personal_gearbox
    else render json: @personal_gearbox.errors, status: :unprocessable_entity
    end
  end

  # DELETE /personal_gearboxes/1
  def destroy
    @personal_gearbox.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personal_gearbox
    @personal_gearbox = PersonalGearbox.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def personal_gearbox_params
    params.require(:personal_gearbox).permit(:user_id, :brand, :reference, :version, :quick_detach, :blowback, :reinfored, :price, :cylinder_id, :cylinder_head_id, :nozzle_id, :piston_id, :piston_head_id, :spring_id, :spring_guide_id)
  end
end
