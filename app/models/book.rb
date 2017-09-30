class Book < ApplicationRecord
  paginates_per 8
  mount_uploader :cover, CoverUploader
  has_many :pictures
  belongs_to :category
  validate :validate_pictures_count, on: [:create, :update]
  validate :validate_dimensions, on: [:create, :update]

  has_and_belongs_to_many :authors, distinct: true do
    # prevent duplication in db
    def << (author)
      author -= self if author.respond_to?(:to_a)
      super author unless include?(author)
    end
  end

  def validate_pictures_count
    errors.add(:pictures_count, "only 4 pictures allowed") if pictures.size >= 4
  end

  accepts_nested_attributes_for :pictures

  accepts_nested_attributes_for :authors

  def validate_dimensions
    begin
      dimensions.each { |_,value| Float(value) }
      return false
    rescue
      errors.add(:dimensions_eror, "allow only numbers")
    end
  end
end
