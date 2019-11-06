class StudyGroup < ApplicationRecord
  belongs_to :course
  has_many :attendees
end
