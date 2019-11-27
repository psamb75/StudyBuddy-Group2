class Tutor < ApplicationRecord
  validates :description, presence: true
  validates :rate, :numericality => true
  validates :hours, presence: true
  belongs_to :user
  belongs_to :course
end
