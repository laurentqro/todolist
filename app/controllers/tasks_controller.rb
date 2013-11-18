class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to tasks_url
  end

end
