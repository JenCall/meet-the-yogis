class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @teachers = User.teachers
  end

end
