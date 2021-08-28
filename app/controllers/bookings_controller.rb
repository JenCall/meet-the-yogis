class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @course = Course.find(booking_params)
    @booking.course = @course
    @booking.user = current_user
    @booking.save!
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
  def booking_params
    params.require(:booking).permit(:course_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
