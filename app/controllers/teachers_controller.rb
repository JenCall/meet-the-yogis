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

    @teacher.courses.each do |course|
      location = Geocoder.search(course.address)
      course.latitude = location.first.coordinates[0]
      course.longitude = location.first.coordinates[1]
    end
    # @markers={lat:location.first.coordinates[0], lng:location.first.coordinates[1] }

    @markers = @teacher.courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude
      }
    end
  end
end

#where(status: "teacher").
