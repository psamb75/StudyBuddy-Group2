class Course < ApplicationRecord
    has_many :notes
    has_many :study_groups
    has_many :tutors

    def self.search(search)
        if search
            self.where(course_code: search)
        else
            self.all
        end
    end
end
