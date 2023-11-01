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
end
