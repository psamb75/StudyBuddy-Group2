class Course < ApplicationRecord
    has_many :notes
    has_many :study_groups
    has_many :tutors
end
