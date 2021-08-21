class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @teachers = User.teachers
    @user = policy_scope(User)
  end

  def show
    @teacher = User.teachers.find(params[:id])
    # @booking = Booking.new
    authorize @teacher

    @markers = @teacher.courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude
      }
    end
  end
end

#where(status: "teacher").
