class TasksController < ApplicationController
  before_action :set_task, only: [:update, :destroy]
   
  # GET /tasks
  def index
    @tasks = Task.all
    render json: @tasks
  end
   
  # POST /tasks
  def create
    @task = Task.new(task_params)
   
    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task, status: :unprocessable_entity
    end
  end
   
  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: { errors: @task.errors }, status: :unprocessable_entity
    end
  end
   
  # DELETE /tasks/1
  def destroy
    @task.destroy
    head 204
  end
   
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
      render json: { message: e.message }, status: :not_found
  end
   
  # Only allow a trusted parameter "white list" through.
  def task_params
    params.require(:task).permit(:title, :done)
  end
end
