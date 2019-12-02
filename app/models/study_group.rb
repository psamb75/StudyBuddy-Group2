class StudyGroup < ApplicationRecord
  validates :event_name, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :description, presence: true
  belongs_to :course
  belongs_to :user
  has_many :attendees
end
