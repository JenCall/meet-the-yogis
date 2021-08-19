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
  end

end
