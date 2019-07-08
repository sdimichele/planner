class Api::GuardiansController < ApplicationController

  def index
    # if current_user
      @guardian = current_user
      render 'index.json.jbuilder'
    # else
    #   render json: []
    # end
  end


   def create
    @guardian = Guardian.new(
                    name: params[:name],
                    email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation]
                    )

    if 
      @guardian.save
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: @guardian.errors.full_messages}, status: :bad_request
    end
   end

end
