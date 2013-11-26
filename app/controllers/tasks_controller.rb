class TasksController < ApplicationController

  before_action :find_task, only: [:edit, :update, :destroy, :open_task, :close_task]

  def index
    @task = Task.new
    @open_tasks = Task.where(status: "open")
    @closed_tasks = Task.where(status: "closed")
  end

  def new
    @task = Task.new
  end

  def create
    colors = %w[MistyRose Plum Thistle Lavender LavenderBlush LemonChiffon LightBlue LightGreen LightSteelBlue PaleVioletRed PeachPuff]
    Task.create description: params[:task][:description], status: "open", color: colors.sample
    redirect_to root_url
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @task.update description: params[:task][:description], color: params[:task][:color], status: params[:task][:status]
    redirect_to root_url
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
  end

  def close_task
    @task.update status: "closed"
    redirect_to root_url
  end

  def open_task
    @task.update status: "open"
    redirect_to root_url
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end

end
