class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.update description: params[:task][:description], color: params[:task][:color], status: params[:task][:status]
    redirect_to root_url
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
    colors = %w[MistyRose Plum Thistle Lavender LavenderBlush LemonChiffon LightBlue LightGreen LightSteelBlue PaleVioletRed PeachPuff]
    Task.create description: params[:task][:description], status: "open", color: colors.sample
    redirect_to tasks_url
  end

end
