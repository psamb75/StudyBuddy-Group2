class Attendee < ApplicationRecord
  after_create :create_notifications

  belongs_to :user
  belongs_to :study_group

  private
  def create_notifications
    Notification.create(recipient: self.study_group.user, actor: self.user,
      action: "#{self.user.name} is attending your study group, #{self.study_group.event_name} in #{self.study_group.course.course_name}", notifiable: self)
  end
end
