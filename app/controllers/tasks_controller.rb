class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def find
    @task = Task.find(params[:id])
  end
end
