class TweetsController < ApplicationController
  #before_action :set_trip, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @trips = Trip.includes(:user).order("created_at DESC")
  end

  def new
    @trip = Trip.new
  end

  def create
    Trip.create(trip_params)
  end

  def destroy
    trip = Trip.find(params[:id])
    trip.destroy
  end

  def edit
  end

  def update
    trip = Tweet.find(params[:id])
    trip.update(trip_params)
  end

  def show
    @comment = Comment.new
    @comments = @trip.comments.includes(:user)
  end

  def search
    @trips = Trip.search(params[:keyword])
  end


  private
  def trip_params
    params.require(:trip).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
