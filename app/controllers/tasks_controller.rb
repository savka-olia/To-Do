class TasksController < ApplicationController 
  before_action :set_task, only: [:show, :edit, :update, :destroy]

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
    @task.destroy
    redirect_to tasks_path
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  private
  def task_params
    params.require(:task).permit(:title, :details)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
