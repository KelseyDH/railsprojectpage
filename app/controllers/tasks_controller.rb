class TasksController < ApplicationController

before_action :find_project





  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_attributes)
    if @task.save
      redirect_to @project, notice: "Task added successfully!"
    else
      render projects_path(@project.id)
    end
  end

  def destroy
    @task = @project.tasks.find(params[:id])
    if @task.destroy
      redirect_to @project, notice: "Task deleted"
    else
      redirect_to @project, alert: "Unable to delete task."
    end
  end



  private

  def task_attributes
    params.require(:task).permit([:title, :due_date])
  end

  def find_project
    @project = Project.find params[:project_id]
  end

end
