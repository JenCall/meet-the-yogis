class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @teachers = User.teachers.joins(:courses).where(courses: {address: params[:query][:address]})
    @user = policy_scope(User)
  end
end


#where(status: "teacher").
