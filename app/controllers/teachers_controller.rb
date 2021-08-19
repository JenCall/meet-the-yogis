class TeachersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]



  def index
    @teachers = User.teachers
    @user = policy_scope(User)
  end

end
