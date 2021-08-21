class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index

    @markers = @courses.geocoded.map do |course|
      {
        lat: course.latitude,
        lng: course.longitude
  end
  def show
    # params[id]
    @user = current_user
    @course = Course.first
  end
end
