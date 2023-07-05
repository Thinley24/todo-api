class TasksController < ApplicationController

    # defining controller methods
    before_action :set_task, only: [:show, :update, :destroy]

    # GET /tasks
    def index
        @tasks = Task.all
        # render json: @tasks
        json_response(@tasks)
    end

    # POST /tasks
    def create
        @user = User.find(params[:user_id])
        @task = @user.tasks.create!(task_params)
        # render json: @task, status: :created
        json_response(@task, :created)
    end

    # GET /tasks/:id
    def show
        # render json: @task
        json_response(@task)
    end

    # PUT /tasks/:id
    def update
        @task.update(task_params)
        head :no_content # to indicate that request was successfully send
    end

    # DELETE /tasks/:id
    def destroy
        @task.destroy
        head :no_content # to indicate that request was successfully deleted
    end

    private
    def task_params
        # whitelist params
        params.permit(:title, :due_date, :status, :description, :created_by)
    end

    def set_task # used as a 'before_action' filter
        @task = Task.find(params[:id]) # finds and sets the task
    end
end
