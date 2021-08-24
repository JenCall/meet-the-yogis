class BookingsController < ApplicationController

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
    @booking.course = @course
    @booking.user = current_user
    @booking.save!
    redirect_to booking_path(@booking)
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
    params.require(:booking)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
