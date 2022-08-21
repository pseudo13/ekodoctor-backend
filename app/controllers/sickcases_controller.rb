class SickcasesController < ApplicationController
  before_action :set_sickcase, only: [:update]

  # GET /api/sickcases
  def index
    render json: Sickcase.all.with_attached_image
  end

  # POST /api/sickcase
  def create
    puts sickcase_params
    newSickcase = Sickcase.new(sickcase_params)
    if newSickcase.save
      render json: newSickcase
    else
      render json: newSickcase.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/sickcases/1
  def update
    if UpdateSickcaseService.new(@sickcase, sickcase_params).call
      render json: @sickcase
    else
      render json: @sickcase.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sickcase
    @sickcase = Sickcase.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sickcase_params
    params.permit(:title, :description, :instruction, :image)
  end
end