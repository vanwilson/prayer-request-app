class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def create
    @user = User.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
    )
    render :show
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(
      first_name: params[:first_name] || @user.first_name,
      last_name: params[:last_name] || @user.last_name,
    )
    render :show
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json: { message: "User successfully deleted" }
  end
end
