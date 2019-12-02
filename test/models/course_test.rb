require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  test 'valid course' do
    course = Course.new(course_code: 'ECE444', course_name: 'Software Engineering')
    assert course.valid?
  end
  
  test 'invalid without course code' do
    course = Course.new( course_name: 'Software Engineering')
    refute course.valid?
    assert_not_nil course.errors[:course_code]
  end

  test 'invalid without course name' do
    course = Course.new( course_code: 'ECE444')
    refute course.valid?
    assert_not_nil course.errors[:course_name]
  end

  test 'invalid with duplicate course code' do
    course_ = Course.new(course_code: 'ECE444', course_name: 'Software Engineering')
    course_.save
    course = Course.new(course_code: 'ECE444', course_name: 'Software Engineering2')
    refute course.valid?
    assert_not_nil course.errors[:name]
  end
end
