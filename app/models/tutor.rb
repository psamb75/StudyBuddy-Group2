class Tutor < ApplicationRecord
  validates :description, presence: true
  validates :rate, :numericality => true
  validates :hours, presence: true
  has_one :tutoring_session
  belongs_to :user
  belongs_to :course
end
