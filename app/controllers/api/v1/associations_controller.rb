class Api::V1::AssociationsController < ApplicationController
  before_action :authenticate_association
  before_action :set_association, only: [:show, :update, :destroy]

  # GET /associations/1
  def show
    render json: @association,status: :ok
  end

  # POST /associations
  def create
    association = @current_user.association.new(association_params)

    if association.save
      render json: association, status: :created
    else
      render json: association.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /associations/1
  def update
    if @association.update(association_params)
      render json: @association
    else
      render json: @association.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_association
      @association = Association.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def association_params
      params.require(:association).permit( :name,:description,location_attributes: [:longitude, :latitude],manager_attributes: [:appointment, :email,:name,:telephone])
    end
end
