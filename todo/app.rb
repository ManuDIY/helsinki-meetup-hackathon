require 'sinatra'
require_relative 'boot'

class Todo
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :done, type: Boolean
  field :completed_at, type: DateTime
end

  get "/?" do
    redirect "/todos"
  end

  # Get all of our routes
  get "/todos" do
    @todos = Todo.desc(:created_at)
    erb :"todo/index"
  end

  # Add the todo to the database
  post "/todos" do
    todo = Todo.new(params[:todo])
    if todo.save
      redirect "/todos"
    else
      erb :"todo/new"
    end
  end

  # Updates the todo with id in the database
  put "/todos/:id" do
    todo = Todo.find(params[:id])
    if params[:todo] && params[:todo][:done]
      todo.completed_at = Time.now
      todo.done = true
    else
      todo.done = false
      todo.completed_at = nil
    end
    todo.save
    redirect "/todos"
  end

  # Deletes the todo with id in the database
  delete '/todos/delete/:id' do
    todo = Todo.find(params[:id])
    todo.delete
    redirect '/todos'
  end
  
