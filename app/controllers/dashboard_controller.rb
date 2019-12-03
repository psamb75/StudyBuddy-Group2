class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :expire_past_session

  def index
    @me = current_user
    @my_courses = @me.enrolments #get all their course enrollments
    @my_study = @me.attendees #get all their event attending
    @my_tutoring_sessions = @me.tutoring_sessions.select{ |s| s.completed == false }
    @notifications = Notification.where(recipient: current_user).unread
  end

  private
  def expire_past_session
    my_tutoring_sessions = current_user.tutoring_sessions.select{ |s| s.completed == false }
    expired_sessions = my_tutoring_sessions.select{ |s| s.tutor.date.advance(hours: s.tutor.hours).past? }
    expired_sessions.each do |expired_session|
      course = expired_session.tutor.course
      tutor = expired_session.tutor.user
      if !Notification.exists?(:recipient => current_user, :actor => tutor, :notifiable => expired_session)
        Notification.create(recipient: current_user, actor: tutor,
        action: "Your Tutoring session with #{tutor.name} in #{course.course_name} has expired, you can now end it in your dashboard!", notifiable: expired_session)
      end
    end
  end
end
