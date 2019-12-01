require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(name: 'John3', email: 'MyString1@test.com', password: 'testing')
    assert user.valid?
  end
  
  test 'invalid without user name' do
    user = User.new(email: 'john@example.com', password: 'testing')
    refute user.valid?, 'user is valid without a name'
    assert_not_nil user.errors[:name], 'no validation error for name present'
  end

  test 'invalid without email' do
    user = User.new(name: 'John2', password: 'testing')
    refute user.valid?
    assert_not_nil user.errors[:email]
  end

  test 'invalid user with duplicate user name' do
    user = User.new(name: 'John1', email: 'MyString3@test.com', password: 'testing')
    user.save
    user_ = User.new(name: 'John1', email: 'MyString4@test.com', password: 'testing')
    refute user_.valid?
    assert_not_nil user_.errors[:name]
  end

  test 'invalid user with duplicate email' do
    user = User.new(name: 'John2', email: 'MyString3@test.com', password: 'testing')
    user.save
    user_ = User.new(name: 'John3', email: 'MyString3@test.com', password: 'testing')
    refute user_.valid?
    assert_not_nil user_.errors[:name]
  end

end
