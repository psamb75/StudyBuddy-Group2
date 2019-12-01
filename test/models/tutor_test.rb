require 'test_helper'

class TutorTest < ActiveSupport::TestCase

  test 'invalid without description' do
    tutor = Tutor.new(rate: '2', hours: '3')
    refute tutor.valid?
    assert_not_nil tutor.errors[:description]
  end

  test 'invalid without rate' do
    tutor = Tutor.new(description: 'testing', hours: '3')
    refute tutor.valid?
    assert_not_nil tutor.errors[:rate]
  end

  test 'invalid without hours' do
    tutor = Tutor.new(description: 'testing', rate: '3')
    refute tutor.valid?
    assert_not_nil tutor.errors[:hours]
  end

end
