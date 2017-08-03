class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to todos_path
  end

  def show
    @todo = Todo.find(params[:id])
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
    @todo = Todo.find(params[:id])
    @todo.completed = true
    @todo.save
    redirect_to todos_path
  end

  def list
    @todos = Todo.all
    # quedaron al revez en la bd por alguna razon
    @completed = @todos.select{ |i| i.completed != true }
    # quedaron al revez en la bd por alguna razon
    @incompleted = @todos.select{ |i| i.completed != false }
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
