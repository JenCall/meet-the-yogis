class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(user_id: current_user.id, course_id: params[:course_id])
    @course = Course.find(params[:course_id])

    redirect_to course_booking_path(@course, @booking.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to root_path
  end

private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
