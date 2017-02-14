class TasksController < ApplicationController
   before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end


  def show
  end

  def new
   @task = Task.new
 end

 def create
  @task = Task.new(task_params)
  @task.save
  redirect_to tasks_path
end

def edit
end

def update
 @task.update(task_params)
 redirect_to tasks_path
end

def destroy
  @task.destroy
  redirect_to tasks_path
end

  def task_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:task).permit(:name, :done)
  end

  def set_task
    @task = Task.find(params[:id])
  end

end
