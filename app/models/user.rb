class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :phone_num, :numericality => true, :allow_blank => true, :length => { :minimum => 9, :maximum => 15 }
    has_many :enrolments
    has_many :courses
    has_many :attendees
    has_many :tutors
    has_many :tutoring_sessions
end
