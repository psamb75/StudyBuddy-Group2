class Note < ApplicationRecord
  validates :tag, presence: true
  validates :file, presence: true
  validates :title, presence: true
  belongs_to :course
  has_one_attached :file
  has_many :comments

  def self.search(search)
    if search
      self.where(title: search)
    else
      self.all
    end
  end
end
