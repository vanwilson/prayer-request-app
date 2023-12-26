class PrayersController < ApplicationController
  before_action :authenticate_user

  def index
    @prayers = Prayer.all

    if params[:id]
      user = User.find_by(id: params[:id])
      @prayers = user.prayers
    end

    render :index
  end

  def create
    @prayer = Prayer.create(
      user_id: current_user.id,
      pray_for: params[:pray_for],
      title: params[:title],
      prayer_type: params[:prayer_type],
      body: params[:body],
    )
    if @prayer.valid?
      render :show
    else
      render json: { message: "Please fill out all fields." }
    end
  end

  def show
    @prayer = Prayer.find_by(id: params[:id])
    render :show
  end

  def update
    @prayer = current_user.prayers.find_by(id: params[:id])
    @prayer.update(
      pray_for: params[:pray_for] || @prayer.pray_for,
      title: params[:title] || @prayer.title,
      prayer_type: params[:prayer_type] || @prayer.prayer_type,
      body: params[:body] || @prayer.body,
    )
    if @prayer.valid?
      render :show
    else
      render json: { errors: @prayer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @prayer = Prayer.find_by(id: params[:id])
    @prayer.destroy
    render json: { message: "Prayer successfully deleted" }
  end
end
