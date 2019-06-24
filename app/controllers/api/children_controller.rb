class Api::ChildrenController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      @children = current_user.children
      # @children = Child.all
      render 'index.json.jbuilder'
    else
      render json: {message: "You are not logged in you can't view your kids!"}, status: :unauthorized
    end
  end

  def create
    @child = Child.new(
                        name: params[:name],
                        picture_url: params[:picture_url]
                      )
    if @child.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @child.errors.full_messages}
    end
  end
  def show
    @child = Child.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @child = Child.find(params[:id])
    @child.name = params[:name]  || @child.name
    @child.picture_url = params[:picture_url] || @child.picture_url

    if @child.save
      render 'show.json.jbuilder'
    else
      render json: {message: @child.errors.full_messages}
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    render json: {message: "You have successfully deleted the child!"}
  end
  
end
