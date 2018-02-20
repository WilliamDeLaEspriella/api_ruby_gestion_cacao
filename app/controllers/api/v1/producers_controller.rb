class Api::V1::ProducersController < ApplicationController
  before_action :authenticate_producer,only: [:show,:update]
  before_action :authenticate_association,only: [:index,:create]
  before_action :set_producer, only: [:show, :update, :destroy]

  # GET /associations/:association_id/producers
  def index
    @producers = @association.producers
    render json: @producers ,status: :ok
  end

  # GET  /associations/:association_id/producers/1
  def show
    render json: @producer,status: :ok
  end

  # POST /associations/:association_id/producers
  def create
    producer = @association.producers.new(producer_params)

    if producer.save
      render json: producer, status: :created
    else
      render json: producer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT  /associations/:association_id/producers/1
  def update
    if @producer.update(producer_params)
      render json: @producer
    else
      render json: @producer.errors, status: :unprocessable_entity
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producer
      @association = Association.find(params[:association_id])
      @producer = @association.producers.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def producer_params
      params.require(:producer).permit(:name,location_attributes: [:longitude, :latitude])
    end
end
