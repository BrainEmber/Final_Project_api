class FusersController < ApplicationController
  before_action :set_fuser, only: [:show, :update, :destroy]

  # GET /fusers
  def index
    @fusers = Fuser.all

    render json: @fusers.to_json(include: :musers)
  end

  # GET /fusers/1
  def show
    render json: @fuser.to_json(include: :musers)
  end

  # POST /fusers
  def create
    @fuser = Fuser.new(fuser_params)

    if @fuser.save
      render json: @fuser, status: :created, location: @fuser
    else
      render json: @fuser.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fusers/1
  def update
    if @fuser.update(fuser_params)
      render json: @fuser
    else
      render json: @fuser.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fusers/1
  def destroy
    @fuser.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuser
      @fuser = Fuser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fuser_params
      params.require(:fuser).permit(:name, :genera, :game, :hours)
    end
end
