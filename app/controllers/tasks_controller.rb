class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
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
    t = Task.new
    t.description = params[:task][:description]
    t.status = "open"
    t.color = colors.sample
    t.save
    redirect_to tasks_url
  end

end
