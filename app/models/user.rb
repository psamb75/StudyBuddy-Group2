class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :timeout_in => 15.minutes 
    validates :name, presence: true, uniqueness: true, length: { maximum: 20 }
    validates :phone_num, :allow_blank => true, format: {:with => /\A(?:\+?\d{1,3}\s*-?)?\(?(?:\d{3})?\)?[- ]?\d{3}[- ]?\d{4}\z/, message: "Please enter a valid phone number"}

    has_many :enrolments
    has_many :courses
    has_many :attendees
    has_many :tutors
    has_many :tutoring_sessions
    has_many :comments
    has_one_attached :avatar
    has_many :notifications, foreign_key: :recipient_id
    has_many :study_groups
    has_many :notes
end
