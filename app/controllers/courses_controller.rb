class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
  end


  def show
    @course = Course.find(params[:id])
    @user = current_user
  end

  #private
  #def course_params
    #params.require(:course).permit(:teacher_id)
  #end

end
