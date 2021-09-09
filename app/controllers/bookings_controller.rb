class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.create(user_id: current_user.id, course_id: params[:course_id])
    @course = Course.find(params[:course_id])


    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @course.title,
          amount: (@course.price * 100).to_i,
          currency: 'eur',
          quantity: 1

        }],
        success_url: booking_url(@booking),
        cancel_url: booking_url(@booking)
      )
      @booking.update(checkout_session_id: session.id)
      redirect_to  new_course_booking_payment_path(@course, @booking)
      authorize @booking
  end

  def show
    @booking = Booking.find(params[:id])

    @markers = [
      {
        lat: @booking.course.latitude,
        lng: @booking.course.longitude
      }]
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
