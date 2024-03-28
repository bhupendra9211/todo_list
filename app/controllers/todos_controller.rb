class TodosController < ApplicationController
    def index
        @list=Todo.all
    end

    def new
        @list=Todo.new
    end


end
