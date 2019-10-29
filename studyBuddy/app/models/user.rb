class User < ApplicationRecord
    has_many :enrolments
    has_many :courses
    has_many :attendees
    has_many :tutors
end
