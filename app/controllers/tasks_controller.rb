class TasksController < ApplicationController 
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task was created successfully."
      redirect_to tasks_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @task.destroy!
    redirect_to tasks_path
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Your task was updated successfully"
      redirect_to @task
    else
      render 'edit'
    end
  end

  def complete
    @task.update_attribute(:completed, params[:completed])
    redirect_back fallback_location: root_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
