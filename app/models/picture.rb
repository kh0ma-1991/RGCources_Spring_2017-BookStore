class Picture < ApplicationRecord
  mount_uploader :url, PictureUploader

  belongs_to :book
  validate :validate_pictures_count, on: [:create, :update]

  def validate_pictures_count
    if book_id
      errors.add(:pictures_count, "only 4 pictures allowed") if Book.find(book_id).pictures.size >= 4
    end
  end
end
