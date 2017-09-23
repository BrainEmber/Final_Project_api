class ApplicationController < ActionController::API

  def authenticate_token
    puts "AUTHENTICATE JWT"
    render json: { status: 401, message: 'Unauthorized' } unless decode_token(bearer_token)
  end


  def bearer_token
    puts "BEARER TOKEN"
    puts header = request.env["HTTP_AUTHORIZATION"]

    pattern = /^Bearer /
    puts "TOKEN WITHOUT BEARER"
    puts header.gsub(pattern, '') if header && header.match(pattern)
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def decode_token(token_input)
    puts "DECODE TOKEN, token input: #{token_input}"
    puts token = JWT.decode(token_input, ENV['JWT_SECRET'], true, { :algorithm => 'HS256'})
    JWT.decode(token_input, ENV['JWT_SECRET'], true, { :algorithm => 'HS256'})
  rescue
    render json: { status: 401, message: 'Unauthorized'}
  end


  # Displayling loged in user

  def get_current_muser
    return if !bearer_token
    decoded_jwt = decode_token(bearer_token)
    Muser.find(decoded_jwt[0]["user"]["id"])
  end

  def get_current_fuser
    return if !bearer_token
    decoded_jwt = decode_token(bearer_token)
    Fuser.find(decoded_jwt[0]["user"]["id"])
  end


  # Restricting user from using params routes they dont own

  def authorize_muser
    puts "AUTHORIZE USER"
    puts "user id #{get_current_muser.id}"
    puts "params: #{params[:id]}"
    render json: { status: 401, message: 'Unauthorized'} unless get_current_muser.id == params[:id].to_i
  end

  def authorize_fuser
    puts "AUTHORIZE USER"
    puts "user id #{get_current_fuser.id}"
    puts "params: #{params[:id]}"
    render json: { status: 401, message: 'Unauthorized'} unless get_current_fuser.id == params[:id].to_i
  end



end
