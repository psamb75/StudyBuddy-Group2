class DashboardController < ApplicationController
  def index
    @me = current_user
    @my_courses = @me.enrolments #get all their course enrollments
    @my_study = @me.attendees #get all their event attending
    @my_tutoring_sessions = @me.tutoring_sessions.select{ |s| s.completed == false }
  end
end
