class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def find
    @task = Task.find(params[:id])
  end

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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end


end
