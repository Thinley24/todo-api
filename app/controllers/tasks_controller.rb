class TasksController < ApplicationController
    def index
        tasks = Task.all
        render json: tasks # renders tasks as json
    end
end
