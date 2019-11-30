class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notifications

  def index
  end

  def mark_read
    notification = Notification.find(params[:notification_id])
    notification.update(read_at: DateTime.current())
    redirect_to dashboard_path
  end

  private
  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
  end
end
