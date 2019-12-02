class Comment < ApplicationRecord
  validates :text, presence: true
  after_create :create_notifications

  belongs_to :user
  belongs_to :note

  private
  def create_notifications
    if self.ancestry != 0
      recipient = Comment.find(self.ancestry).user
      note = self.note
      course = note.course
      Notification.create(recipient: recipient, actor: self.user,
        action: "#{self.user.name} replied to your comment on note #{note.title} in course #{course.course_name}", notifiable: self)
    end
  end
end
