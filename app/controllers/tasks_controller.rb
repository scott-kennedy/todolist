class TasksController < ApplicationController
  respond_to :html

  before_filter :find_list

  def create
    @task = @list.tasks.new(params[:task])
    if @task.save
      flash[:notice] = 'Task was successfully created.'
    else
      flash[:notice] = 'Unable to create task.'
    end
    redirect_to list_url(@list)
  end

  def complete
    find_task
    @task.completed = true
    @task.save
    redirect_to list_url(@list)
  end

  def undo
    find_task
    @task.completed = false
    @task.save
    redirect_to list_url(@list)
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_task
    @task = @list.tasks.find(params[:id])
  end

end
