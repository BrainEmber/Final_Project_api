class MusersController < ApplicationController
  before_action :set_muser, only: [:show, :update, :destroy]
  before_action :authenticate_token, except: [:login, :create]
  before_action :authorize_muser, except: [:login, :create, :index]


  def login
      muser = Muser.find_by(username: params[:muser][:username])

      if muser && muser.authenticate(params[:muser][:password])
        token = create_token(muser.id, muser.username)
        render json: {status: 200, token: token, muser: muser}
      else
        render json: {status: 401, message: "Unauthorized"}
      end
  end


  # GET /musers
  def index
    @musers = Muser.all

    render json: @musers.to_json(include: :fusers)
  end

  # GET /musers/1
  def show
    render json: @muser
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
    def set_muser
      @muser = Muser.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def muser_params
      params.require(:muser).permit(:name, :genera, :game, :hours)
    end
end
