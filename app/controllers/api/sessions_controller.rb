class Api::SessionsController < ApplicationController
    def create
    guardian = Guardian.find_by(email: params[:email])
    if guardian && guardian.authenticate(params[:password])
      
      jwt = JWT.encode(
        {
          guardian_id: guardian.id, 
          exp: 24.hours.from_now.to_i 
        },
        Rails.application.credentials.fetch(:secret_key_base), 
        'HS256'
      )
      render json: {jwt: jwt, email: guardian.email, user_id: guardian.id}, status: :created
    else
      render json: {}, status: :unauthorized
    end
  end
end

