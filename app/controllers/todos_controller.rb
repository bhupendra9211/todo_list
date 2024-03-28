class TodosController < ApplicationController
    def index
        @list=Todo.all
    end


end
