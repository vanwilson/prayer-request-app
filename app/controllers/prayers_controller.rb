class PrayersController < ApplicationController
  def index
    @prayers = Prayer.all
    render :index
  end
end
