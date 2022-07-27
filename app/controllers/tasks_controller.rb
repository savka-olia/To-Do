class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy, :complete]

  def index
    @tasks = current_user.tasks.all
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
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
      flash[:notice] = "Task was updated successfully"
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
    params.require(:task).permit(:title, :details, :completed, :user_id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
