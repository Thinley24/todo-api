class TasksController < ApplicationController

    # defining controller methods
    before_action :set_task, only: [:show, :update, :destroy]

    # GET /tasks
    def index
        # @tasks = Task.all
        # render json: @tasks

        ## get only current user's tasks
        @tasks = current_user.tasks
        json_response(@tasks)
    end

    # POST /tasks
    def create
        # @user = User.find(params[:user_id])
        # @task = @user.tasks.create!(task_params)
        # render json: @task, status: :created

        ## create tasks for only current user
        # @task = current_user.tasks.create!(task_params) 
        @task = Task.create!(task_params.merge(user_id: params[:user_id]))
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
        # params.permit(:title, :due_date, :status, :description, :created_by)

        ## remove all including 'created_by' from list of permitted param except title
        params.permit(:title, :due_date, :status, :description, :created_by) 
    end

    def set_task # used as a 'before_action' filter
        @task = Task.find(params[:id]) # finds and sets the task
    end
end
