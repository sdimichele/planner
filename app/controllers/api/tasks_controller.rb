class Api::TasksController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      # @task = current_user.tasks
      @tasks = Task.where(id: [:child_id])
      render 'index.json.jbuilder'
    else
      render json: {message: "You are not logged in and can't view tasks!"}
    end
  end

  def create
    @task = Task.new(
                      guardian_id: current_user.id,
                      name: params[:name],
                      description: params[:description],
                      time: params[:time],
                      status: params[:status]
                    )
    if  @task.save
      render 'show.json.jbuilder'
    else
      render json: {message: @task.errors.full_messages }
    end
  end

  def show
    @task = Task.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @task = Task.find(params[:id])
    @task.guardian_id = params[:guardian_id] || @task.guardian_id
    @task.name = params[:name] || @task.name
    @task.description = params[:description] || @task.description 
    @task.time = params[:time] || @task.time
    @task.status = params[:status] || @task.status

    if @task.save
      render 'show.json.jbuilder'
    else
      render json: {message: @task.errors.full_messages}
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    render json: {message: "You have successfully deleted the task!"}
  end
end
