class SessionsController < ApplicationController
  def index
  end
  
  def new
  end
  
  def create
    if params[:name].nil? || params[:name].empty?
      redirect_to controller: "sessions", action: "new"
    else
      session[:name] = params[:name]
      redirect_to controller: "sessions", action: "index"
    end
  end
  
  def destroy
    session.delete :name
    redirect_to controller: "sessions", action: "new"
  end
  
  private
    def sesh_params
      params.require(session).permit(:name)
    end
end