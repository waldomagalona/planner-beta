class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET categories/1/tasks
  def index
    @tasks = @category.tasks
    @tasks_due_today = Task.where(date: Date.today).where(category_id: @category.id).order("date ASC").order("category_id ASC")
  end

  # GET categories/1/tasks/1
  def show
  end

  # GET categories/1/tasks/new
  def new
    @task = @category.tasks.build
  end

  # GET categories/1/tasks/1/edit
  def edit
  end

  # POST categories/1/tasks
  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      redirect_to(@task.category)
    else
      render action: '../categories/show'
    end
  end

  # PUT categories/1/tasks/1
  def update
    if @task.update(task_params)
      redirect_to(@task.category)
    else
      render action: '../categories/show'
    end
  end

  # DELETE categories/1/tasks/1
  def destroy
    @task.destroy

    redirect_to @category
  end

  def list
    @task_today = @tasks.where("date >= ? and date < ?", Date.current, Date.current+1).order("date, category_id")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = current_user.categories.find(params[:category_id])
    end

    def set_task
      @task = @category.tasks.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :status, :category_id, :date)
    end
end
