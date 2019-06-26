class Api::ChildrenTasksController < ApplicationController
  before_action :authenticate_user
  def index
    if current_user
      @children_tasks = current_user.tasks
      render 'index.json.jbuilder'
    else
      render json: {message: "You can not view all children tasks"},
        status: :unauthorized
    end
  end

  def create
    if current_user
      @children_task = ChildrenTask.new(
                                         child_id: params[:child_id],
                                         task_id: params[:task_id]
                                        )
      @children_task.save
      render 'show.json.jbuilder'
    else
      render json: {message: "You are not login"}
    end

  end
  
  def show
  
  end

  def update
  end

  def destroy

  end

end
