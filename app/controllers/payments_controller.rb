class PaymentsController < ApplicationController

  def new
    @booking = current_user.bookings.where(state: 'pending').find(params[:booking_id])

    course = Course.find(params[:course_id])
    @teacher = course.user
  end
end
