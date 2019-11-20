class Note < ApplicationRecord
  belongs_to :course
  has_one_attached :file

  def self.search(search)
    if search
      self.where(title: search)
    else
      self.all
    end
  end
end
