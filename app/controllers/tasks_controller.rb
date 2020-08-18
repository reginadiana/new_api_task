# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[update destroy]
  
  def index
    @tasks = Task.all
    render json: @tasks
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      render json: @task, status: :created, location: @task
    else
      render json: @task, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: { errors: @task.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @task.destroy
    head 204
  end

  private

  def set_task
    @task = Task.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { message: e.message }, status: :not_found
  end

  def task_params
    params.require(:task).permit(:title, :done)
  end
end
