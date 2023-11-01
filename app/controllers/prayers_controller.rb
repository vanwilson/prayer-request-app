class PrayersController < ApplicationController
  def index
    @prayers = Prayer.all
    render :index
  end

  def create
    @prayer = Prayer.create(
      title: params[:title],
      body: params[:body],
    )
    render :show
  end

  def show
    @prayer = Prayer.find_by(id: params[:id])
    render :show
  end

  def update
    @prayer = Prayer.find_by(id: params[:id])
    @prayer.update(
      title: params[:title] || @prayer.title,
      body: params[:body] || @prayer.body,
    )
    render :show
  end

  def destroy
    @prayer = Prayer.find_by(id: params[:id])
    @prayer.destroy
    render json: { message: "Prayer destroyed successfully" }
  end
end
