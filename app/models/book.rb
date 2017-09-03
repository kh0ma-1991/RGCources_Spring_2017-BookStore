class Book < ApplicationRecord
  has_many :pictures
  validate :validate_pictures_count, on: [:create, :update]

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
end
