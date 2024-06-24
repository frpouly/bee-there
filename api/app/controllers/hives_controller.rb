class HivesController < ApplicationController
  before_action :set_hive, only: %i[ show update destroy ]

  # GET /hives
  def index
    @hives = Hive.all

    render json: @hives
  end

  # GET /hives/1
  def show
    render json: @hive
  end

  # POST /hives
  def create
    @hive = Hive.new(hive_params)

    if @hive.save
      render json: @hive, status: :created, location: @hive
    else
      render json: @hive.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hives/1
  def destroy
    @hive.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hive
      @hive = Hive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hive_params
      params.require(:hive).permit(:name, :weight)
    end
end
