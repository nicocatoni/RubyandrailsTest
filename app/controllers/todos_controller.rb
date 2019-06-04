class TodosController < ApplicationController
    def index
        @todos = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def create 
        @todo = Todo.new(todo_params)
        @todo.completed = false 
        @todo.save 
        redirect_to todos_path

    end

    def show
        @todo = Todo.find(params[:id])
        if @todo.completed == true
          @done = "Está hecha."
        else
          @done = "Aun no ha sido completada."
        end
    end

    def edit 
        @todo = Todo.find(params[:id])
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(todo_params)
        redirect_to todos_path
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to todos_path
    end

    def complete
        @todo =   Todo.find(params[:id])
        @todo.update(completed: true)
        redirect_to todos_path
    end

    def list
        @todos_undone = Todo.all.where(completed: false)
        @todos_done = Todo.all.where(completed: true)
    end




    

    private 
    def todo_params
    params.require(:todo).permit(:description, :completed)
    end

end
