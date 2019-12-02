class Note < ApplicationRecord
  validates :tag, presence: true
  validates :file, presence: true
  validates :title, presence: true
  belongs_to :course
  belongs_to :user
  has_one_attached :file, dependent: :delete_all
  has_many :comments, dependent: :delete_all 

  def self.search(search)
    if search
      #self.where(title: search)
      self.where("LOWER(title) LIKE LOWER('%#{search}%')")
    else
      self.all
    end
  end
end
