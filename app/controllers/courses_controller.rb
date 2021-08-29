class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
  end


  def show
    @course = Course.find(params[:id])

    @teacher = @course.user


    # @markers = {lat:location.first.coordinates[0], lng:location.first.coordinates[1]}

    @markers = [
      {
        lat: @course.latitude,
        lng: @course.longitude
      }]
    end

   # @user = current_user
   # @teacher.price = @course

  end

  #private
  #def course_params
    #params.require(:course).permit(:teacher_id)
  #end

end

