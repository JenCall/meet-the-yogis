class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @teachers = User.address_based_teacher_search(params[:query])
  end


end
