class PrayersController < ApplicationController
  def index
    @prayers = Prayer.all
    render :index
  end

  def create
    @prayer = Prayer.create(
      user_id: params[:user_id],
      pray_for: params[:pray_for],
      title: params[:title],
      prayer_type: params[:prayer_type],
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
      user_id: params[:user_id] || @prayer.user_id,
      pray_for: params[:pray_for] || @prayer.pray_for,
      title: params[:title] || @prayer.title,
      prayer_type: params[:prayer_type] || @prayer.prayer_type,
      body: params[:body] || @prayer.body,
    )
    render :show
  end

  def destroy
    @prayer = Prayer.find_by(id: params[:id])
    @prayer.destroy
    render json: { message: "Prayer successfully deleted" }
  end
end
