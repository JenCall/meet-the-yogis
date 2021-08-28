class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
    @booking.course = @course
    @booking.user = current_user
    @booking.save!
  end

  def show
    @course = Course.find(params[:id])
    @user = current_user
    @teacher.price = @course
  end

  #private
  #def course_params
    #params.require(:course).permit(:teacher_id)
  #end
  
end
