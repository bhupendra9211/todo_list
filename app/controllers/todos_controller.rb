class TodosController < ApplicationController
    def index
        @task=Todo.all
    end

    def new
        @task=Todo.new
    end

    def create
        @task = Todo.new(task_params)
        if @task.save 
            redirect_to todos_path
        else
            render :new
        end
    end


    private

    def task_params
        params.require(:todo).permit(:task)
    end


end
