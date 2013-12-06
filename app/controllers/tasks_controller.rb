class TasksController < ApplicationController

  before_action :find_task, only: [:edit, :update, :destroy, :open_task, :close_task]

  def index
    @task = Task.new

    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
      @open_tasks = @user.tasks.where(status: 'open').order('updated_at DESC')
      @closed_tasks = @user.tasks.where(status: 'closed').order('updated_at DESC')
    end

  end

  def new
    @task = Task.new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    colors = %w[LightGoldenRodYellow MintCream OldLace DarkSeaGreen MistyRose Plum Thistle Lavender LavenderBlush LemonChiffon LightBlue RosyBrown LightSteelBlue PaleVioletRed PeachPuff]
    @user.tasks.create description: params[:task][:description], status: "open", color: colors.sample
    redirect_to root_url
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @task.update  description: params[:task][:description],
                  color: params[:task][:color],
                  status: params[:task][:status]

    respond_to do |format|
      format.html { redirect_to root_url }
      format.js
    end
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
    redirect_to root_url, notice: ["Well done!",
                                  "Fabulous! You can pat yourself on the back, now.",
                                  "You are a machine!",
                                  "My God, you are a bloodthirsty task killer!",
                                  "Check!",
                                  "And another bites the dust!"].sample
  end

  def open_task
    @task.update status: "open"
    redirect_to root_url
  end

  def find_task
    @task = Task.find_by(id: params[:id])
  end

end
