class DashboardController < ApplicationController
  def index
    @me = curent_user
    @my_courses = @me.enrolments #get all their course enrollments
    @my_study = @me.attendees #get all their event attending
  end
end
