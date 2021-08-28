class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @teachers = User.teachers
    apply_filters if params[:query]
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

  def apply_filters
    if params[:query][:address]
      @teachers = @teachers.joins(:courses).where(courses: {address: params[:query][:address]})
    end
    if params[:query][:date]
      @teachers = @teachers.joins(:courses).where(courses: {date: params[:query][:date]})
    end
    if params[:query][:style]
      @teachers = @teachers.where({style: params[:query][:style]})
    end
#convert params/query/date value from string to date. .toDate?
  end
end

#where(status: "teacher").
