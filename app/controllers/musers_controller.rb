class MusersController < ApplicationController
  before_action :set_muser, only: [:show, :update, :destroy]

  # GET /musers
  def index
    @musers = Muser.all

    render json: @musers.to_json(include: :fusers)
  end

  # GET /musers/1
  def show
    render json: @muser.to_json(include: :fusers)
  end

  # POST /musers
  def create
    @muser = Muser.new(muser_params)

    if @muser.save
      render json: @muser, status: :created, location: @muser
    else
      render json: @muser.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /musers/1
  def update
    if @muser.update(muser_params)
      render json: @muser
    else
      render json: @muser.errors, status: :unprocessable_entity
    end
  end

  # DELETE /musers/1
  def destroy
    @muser.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muser
      @muser = Muser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def muser_params
      params.require(:muser).permit(:name, :genera, :game, :hours)
    end
end
