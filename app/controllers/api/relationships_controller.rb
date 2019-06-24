class Api::RelationshipsController < ApplicationController
  def index
    if current_user
      @relationships = current_user.relationships
      # @relationships = Relationship.all
      render 'index.json.jbuilder'
    else
      render json: {message: "you are not logged in you can't access your relationships"}
    end
  end

  def create
    @Relationship = Relationship.new(
                                     guardian_id: params[:guardian_id],
                                     child_id: params[:child_id],
                                     parent: params[:parent]
      )

    if @Relationship.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @Relationship.errors.full_messages}
    end
  end

  def show
    @Relationship = Relationship.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @relationship = Relationship.new
    @relationship.guardian_id = params[:guardian_id] || @guardian_id
    @relationship.child_id = params[:child_id] || @relationship.child_id

    if @relationship.save
      render 'show.json.jbuilder'
    else
      render json: {message: @Relationship.errors.full_messages}
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    @relationship.destroy
    render json: {message: "You have successfully deleted this relationship!"}
  end
end
