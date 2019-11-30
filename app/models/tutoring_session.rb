class TutoringSession < ApplicationRecord
  after_create :create_notifications

  belongs_to :user
  belongs_to :tutor


  private
  def create_notifications
    Notification.create(recipient: self.tutor.user, actor: self.user,
      action: 'Tutoring service has been purchased!', notifiable: self)
  end
end
