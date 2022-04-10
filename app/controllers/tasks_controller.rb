class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  # before: find in filename | hard-coded routes
  def show; end

  # Creates a new empty task instance that the form_for helper can use as input.
  # form_for helper checks for ID. Since it is empty here, task gets created.
  # This is done via the action="post". For post updates, action="patch".
  # The different HTTP action means that another route (update not create) is called.
  def new
    @task = Task.new
  end

  # Is linked to the POST route of the form. Takes params and creates new DB entry.

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
