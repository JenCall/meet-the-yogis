class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index

    @teachers = User.teachers
    apply_filters if params[:query]
    @styles = []
    Course.all.each do |course|
      @styles << course.classstyle
    end
    @styles.uniq!

    @addresses = []
    Course.all.each do |course|
      @addresses << course.address
    end
    @addresses.uniq!
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
    if params[:query][:address].present?
      @teachers = @teachers.joins(:courses).where(courses: {address: params[:query][:address]})
    end
    if params[:query][:date].present?
      @teachers = @teachers.joins(:courses).where(courses: {date: params[:query][:date]})
    end
    if params[:query][:style].present?
      @teachers = @teachers.joins(:courses).where(courses: {classstyle: params[:query][:style]})
    end
    if params[:query][:level].present?
      @teachers = @teachers.joins(:courses).where(courses: {level: params[:query][:level]})
    end

#convert params/query/date value from string to date. .toDate?
  end
end

#where(status: "teacher").
