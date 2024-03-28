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
            redirect_to todos_path, notice: 'Task has been created sucessfully'
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
            redirect_to todos_path, notice: 'Task has been updated sucessfully'
        else
            render :edit
        end
    end

    def destroy
        @task = Todo.find(params[:id])
        if @task.destroy
            redirect_to todos_path, notice: 'Task has bee destroy sucessfully'
        end
    end


    private

    def task_params
        params.require(:todo).permit(:task)
    end


end
