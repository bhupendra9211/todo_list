class TodosController < ApplicationController
    before_action :set_task, only: [:edit, :update, :destroy]
    def index
        @tasks=Todo.all
    end

    def new
        @task=Todo.new
    end

    def create
        @task = Todo.new(task_params)
        if @task.save 
            redirect_to root_path, notice: 'Task has been created sucessfully'
        else
            render :new
        end
    end

    def edit
        @task = Todo.find(params[:id])
    end

    def update
        @task = Todo.find(params[:id])
        if @task.update(task_params)
            redirect_to root_path, notice: 'Task has been updated sucessfully'
        else
            render :edit
        end
    end

    def destroy
        @task = Todo.find(params[:id])
        if @task.destroy
            redirect_to root_path, notice: 'Task has bee destroy sucessfully'
        end
    end


    private

    def set_task
        @task = Todo.find(params[:id])
      end

    def task_params
        params.require(:todo).permit(:task)
    end


end
