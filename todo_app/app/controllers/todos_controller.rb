class TodosController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy, :complete]
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
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    redirect_to todos_path
  end

  def destroy
    @todo.destroy
    redirect_to todos_path
  end

  def complete
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

  def find_post
    @todo = Todo.find(params[:id])
  end
end
