class StudyGroup < ApplicationRecord
  validates :event_name, presence: true
  validates :time, presence: true
  validates :location, presence: true
  validates :description, presence: true
  belongs_to :course
  has_many :attendees
end
