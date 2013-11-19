class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find_by(id: params[:id])
    @task.destroy
    redirect_to tasks_url
  end

  def new
    @task = Task.new
  end

  def create
    t = Task.new
    t.description = params[:task][:description]
    t.status = params[:task][:status]
    t.color = params[:task][:color]
    t.save
    redirect_to tasks_url
  end

end
