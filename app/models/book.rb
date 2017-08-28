class Book < ApplicationRecord
  has_and_belongs_to_many :authors, distinct: true do
    # prevent duplication in db
    def << (author)
      author -= self if author.respond_to?(:to_a)
      super author unless include?(author)
    end
  end
end
