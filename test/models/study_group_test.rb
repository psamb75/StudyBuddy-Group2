require 'test_helper'

class StudyGroupTest < ActiveSupport::TestCase

  test 'invalid without event name' do
    study_group = StudyGroup.new(time: '2', location: 'SF', description: 'testing')
    refute study_group.valid?
    assert_not_nil study_group.errors[:event_name]
  end

  test 'invalid without time' do
    study_group = StudyGroup.new(event_name: 'test', location: 'SF', description: 'testing')
    refute study_group.valid?
    assert_not_nil study_group.errors[:time]
  end

  test 'invalid without event location' do
    study_group = StudyGroup.new(time: '2', event_name: 'test', description: 'testing')
    refute study_group.valid?
    assert_not_nil study_group.errors[:location]
  end

  test 'invalid without event description' do
    study_group = StudyGroup.new(time: '2', location: 'SF', event_name: 'test')
    refute study_group.valid?
    assert_not_nil study_group.errors[:description]
  end

end
