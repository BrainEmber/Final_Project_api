class FusersController < ApplicationController
  before_action :set_fuser, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_fuser, except: [:login, :create, :index]

  def login
      fuser = Fuser.find_by(username: params[:fuser][:username])

      if fuser && fuser.authenticate(params[:fuser][:password])
        token = create_token(fuser.id, fuser.username)
        render json: {status: 200, token: token, fuser: fuser}
      else
        render json: {status: 401, message: "Unauthorized"}
      end
  end


  # GET /fusers
  def index
    @fusers = Fuser.all

    render json: @fusers.to_json(include: :musers)
  end

  # GET /fusers/1
  def show
    render json: @user
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

  def create_token(id, username)
    JWT.encode(payload(id, username), ENV['JWT_SECRET'], 'HS256')
  end

  def payload(id, username)
  {
    exp: (Time.now + 30.minutes).to_i,
    iat: Time.now.to_i,
    iss: ENV['JWT_ISSUER'],
    user: {
      id: id,
      username: username
    }
  }
  end





    # Use callbacks to share common setup or constraints between actions.
    def set_fuser
      @fuser = Fuser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fuser_params
      params.require(:fuser).permit(:name, :genera, :game, :hours)
    end
end
